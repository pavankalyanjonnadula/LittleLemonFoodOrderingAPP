//
//  NavigationHeader.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 17.05.2024.
//

import SwiftUI

struct NavigationHeader: View {
    // MARK: Properties
    @Environment(\.presentationMode) var presentation
    let navigationEnabled: Bool
    let callback: () -> Void
    
    
    var body: some View {
        HStack(alignment: .center) {
            VStack {
                Image(systemName: "arrow.backward")
                    .font(.system(size: 18))
                    .foregroundStyle(.white)
            }
            .frame(width: 40, height: 40)
            .background(.primaryGreen)
            .clipShape(Circle())
            .padding(10)
            .opacity(navigationEnabled ? 0 : 1)
            .onTapGesture {
                presentation.wrappedValue.dismiss()
            }
            Spacer()
            HStack(alignment: .center, spacing: 4) {
                Image("LogoLime")
                    .resizable()
                    .aspectRatio(0.57, contentMode: .fit)
                    .frame(height: 50)
                Text("Little Lemon")
                    .textCase(.uppercase)
                    .font(.custom("MarkaziText-Medium", size: 13))
                    .fontWeight(.bold)
                    .foregroundStyle(.primaryGreen)
                    .tracking(2)
            }
            Spacer()
            NavigationLink(destination: {
                UserProfile(callback: {
                    callback()
                })
            }, label: {
                Image("Profile")
                    .resizable()
                    .frame(width: 50, height: 50)
            })
            .disabled(!navigationEnabled)
            
        }
        .padding(.horizontal, 20)
    }
}

#Preview {
    NavigationHeader(navigationEnabled: true) {}
}
