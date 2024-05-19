//
//  MenuCell.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 18.05.2024.
//

import SwiftUI

struct MenuCell: View {
    let title: String
    let description: String
    let price: String
    let image: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
                .font(.custom("Karla-Regular", size: 18))
                .fontWeight(.bold)
                .foregroundStyle(.highlightBlack)
            HStack(alignment: .top, spacing: 10) {
                VStack(alignment: .leading, spacing: 10) {
                    Text(description)
                        .font(.custom("Karla-Regular", size: 16))
                        .foregroundStyle(.primaryGreen)
                    Text(price)
                        .font(.custom("Karla-Regular", size: 18))
                        .fontWeight(.medium)
                        .foregroundStyle(.primaryGreen)
                }
                Spacer()
                AsyncImage(url: URL(string: image)!) { image in
                    image
                        .resizable()
                        .frame(width: 100, height: 100)
                } placeholder: {
                    ProgressView()
                        .frame(width: 100, height: 100)
                        .tint(.primaryGreen)
                }
            }
        }
    }
}

#Preview {
    MenuCell(
        title: "Greek Salad",
        description: "Very long test description",
        price: "12.99",
        image: "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/greekSalad.jpg?raw=true"
    )
}
