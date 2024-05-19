//
//  Home.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 14.05.2024.
//

import SwiftUI

struct Home: View {
    @State var searchText: String = ""
    let persistent = PersistenceController.shared
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationStack() {
            VStack(spacing: 0) {
                NavigationHeader(navigationEnabled: true) {
                    presentation.wrappedValue.dismiss()
                }
                HomeHeader(searchText: $searchText)
                Menu(searchText: $searchText)
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                    .environment(\.managedObjectContext, persistent.container.viewContext)
                Spacer()
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    Home()
}
