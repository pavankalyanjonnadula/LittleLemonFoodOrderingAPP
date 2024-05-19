//
//  HomeHeader.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 17.05.2024.
//

import SwiftUI

struct HomeHeader: View {
    @Binding var searchText: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Little Lemon")
                .font(.custom("MarkaziText-Medium", size: 60))
                .fontWeight(.regular)
                .foregroundStyle(.primaryYellow)
                .padding(.horizontal, 10)
                .padding(.bottom, -20)
            HStack {
                VStack(alignment: .leading, spacing: 20) {
                    Text("Chicago")
                        .font(.custom("MarkaziText-Medium", size: 40))
                        .fontWeight(.regular)
                        .foregroundStyle(.highlightWhite)
                    Text("We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.")
                        .font(.custom("Karla-Regular", size: 16))
                        .fontWeight(.medium)
                        .foregroundStyle(.highlightWhite)
                }
                Image("HeaderImage")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(RoundedRectangle(cornerSize: .init(width: 10, height: 10)))
            }
            .padding(.horizontal, 10)
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search menu", text: $searchText)
            }
            .padding()
            .background(.highlightWhite)
            .clipShape(RoundedRectangle(cornerSize: .init(width: 5, height: 5)))
            .padding(.horizontal, 10)
            .padding(.bottom, 20)
        }
        .background(.primaryGreen)
    }
}

#Preview {
    Home()
}
