//
//  Menu.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 14.05.2024.
//

import SwiftUI

struct Menu: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Binding var searchText: String
    @State var selectedCategory: String = ""
    
    var body: some View {
        VStack {
            List {
                FetchedObjects(predicate: NSPredicate(value: true)) { (dishes: [Dish]) in
                    let categories = Set(dishes.compactMap { $0.category })
                    let sortedCategories = categories.sorted()
                    
                    VStack(alignment: .leading, spacing: 0) {
                        Text("order for delivery!")
                            .textCase(.uppercase)
                            .font(.custom("Karla-Regular", size: 18))
                            .fontWeight(.heavy)
                            .foregroundStyle(.highlightBlack)
                            .padding(.horizontal, 10)
                            .padding(.top, 40)
                        ScrollView(.horizontal) {
                            LazyHStack(spacing: 20) {
                                ForEach(sortedCategories, id: \.self) { category in
                                    Text(category.capitalized)
                                        .font(.custom(
                                            "Karla-Regular",
                                            size: 16
                                        ))
                                        .fontWeight(.bold)
                                        .foregroundStyle(.primaryGreen)
                                        .padding(.vertical, 8)
                                        .padding(.horizontal, 10)
                                        .background(selectedCategory == category ? .primaryYellow : .highlightWhite)
                                        .clipShape(RoundedRectangle(cornerRadius: 14))
                                        .onTapGesture {
                                            if selectedCategory == category {
                                                selectedCategory = ""
                                            } else {
                                                selectedCategory = category
                                            }
                                        }
                                }
                            }
                            .padding(.horizontal, 10)
                        }
                        .listRowInsets(.init())
                        .frame(height: 60)
                    }
                    .listRowInsets(.init())
                }
                
                FetchedObjects(predicate: buildPredicate(), sortDescriptors: buildSortDescriptors()) {
                    (dishes: [Dish]) in
                    ForEach(dishes) { dish in
                        HStack {
                            let title = dish.title ?? ""
                            let description = dish.dishDescription ?? ""
                            let price = "$\(dish.price ?? "")"
                            let image = dish.image ?? ""
                            
                            MenuCell(
                                title: title,
                                description: description,
                                price: price,
                                image: image
                            )
                        }
                    }
                }
            }
            .listStyle(.plain)
        }
        .onAppear {
            getMenuData()
        }
    }
    
    func getMenuData() {
        PersistenceController.shared.clear()
        
        let url = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(MenuList.self, from: data)
                    
                    for item in result.menu {
                        let dish = Dish(context: viewContext)
                        dish.title = item.title
                        dish.dishDescription = item.description
                        dish.image = item.image
                        dish.price = item.price
                        dish.category = item.category
                    }
                    try? viewContext.save()
                } catch { }
            }
        }
        task.resume()
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title", ascending: true, selector: #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSPredicate {
        let categoryPredicate: NSPredicate
        if selectedCategory.isEmpty {
            categoryPredicate = NSPredicate(value: true)
        } else {
            categoryPredicate = NSPredicate(format: "category CONTAINS[cd] %@", selectedCategory)
        }
        
        let titlePredicate: NSPredicate
        if searchText.isEmpty {
            titlePredicate = NSPredicate(value: true)
        } else {
            titlePredicate = NSPredicate(format: "title CONTAINS[cd] %@", searchText)
        }
        
        return NSCompoundPredicate(
            type: .and, 
            subpredicates: [categoryPredicate, titlePredicate]
        )
    }
}

#Preview {
    Home()
}
