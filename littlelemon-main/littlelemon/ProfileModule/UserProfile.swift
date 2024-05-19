//
//  UserProfile.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 14.05.2024.
//

import SwiftUI

struct UserProfile: View {
    @State private var firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    @State private var lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    @State private var email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @State private var phone = UserDefaults.standard.string(forKey: kPhone) ?? ""
    
    @Environment(\.presentationMode) var presentation
    
    var callback: () -> Void
    
    var body: some View {
        VStack() {
            NavigationHeader(navigationEnabled: false){}
            
            ScrollView() {
                VStack(alignment: .center, spacing: 20) {
                    VStack(alignment: .leading) {
                        Text("Personal information")
                            .font(.custom("Karla-Regular", size: 18))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                        
                    VStack(alignment: .leading) {
                        Text("Avatar")
                            .font(.custom("Karla-Regular", size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryGreen)
                        HStack(spacing: 20) {
                            Image("Profile")
                                .resizable()
                                .frame(width: 100, height: 100)
                            
                            Button {
                                
                            } label: {
                                Text("Change")
                                    .font(.custom("Karla-Regular", size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.highlightWhite)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 14)
                            .background(.primaryGreen)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            
                            Button {
                                
                            } label: {
                                Text("Remove")
                                    .font(.custom("Karla-Regular", size: 16))
                                    .fontWeight(.semibold)
                                    .foregroundStyle(.primaryGreen)
                                    .padding(.vertical, 10)
                                    .padding(.horizontal, 14)
                                    .border(Color.primaryGreen)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading) {
                        Text("First name")
                            .font(.custom("Karla-Regular", size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryGreen)
                        TextField("", text: $firstName)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.primaryGreen, lineWidth: 1)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Last name")
                            .font(.custom("Karla-Regular", size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryGreen)
                        TextField("", text: $lastName)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.primaryGreen, lineWidth: 1)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.custom("Karla-Regular", size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryGreen)
                        TextField("", text: $email)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.primaryGreen, lineWidth: 1)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    
                    VStack(alignment: .leading) {
                        Text("Phone number")
                            .font(.custom("Karla-Regular", size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.primaryGreen)
                        TextField("", text: $phone)
                            .padding(10)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(.primaryGreen, lineWidth: 1)
                            )
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    
                    Button(action: {
                        UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                        presentation.wrappedValue.dismiss()
                        callback()
                    }, label: {
                        Text("Log out")
                            .font(.custom("Karla-Regular", size: 16))
                            .fontWeight(.semibold)
                            .foregroundStyle(.highlightBlack)
                    })
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(.primaryYellow)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.secondaryDark, lineWidth: 1)
                    )
                    .padding(.horizontal, 10)
                    
                    HStack(spacing: 0) {
                        Button {
                            firstName = ""
                            lastName = ""
                            email = ""
                            phone = ""
                        } label: {
                            Text("Discard changes")
                                .font(.custom("Karla-Regular", size: 16))
                                .fontWeight(.semibold)
                                .foregroundStyle(.primaryGreen)
                        }
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(.primaryGreen, lineWidth: 1)
                        )
                        .frame(width: 160)
                        
                        
                        Button {
                            UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                            UserDefaults.standard.setValue(lastName, forKey: kLastName)
                            UserDefaults.standard.setValue(email, forKey: kEmail)
                            UserDefaults.standard.setValue(phone, forKey: kPhone)
                        } label: {
                            Text("Save changes")
                                .font(.custom("Karla-Regular", size: 16))
                                .fontWeight(.semibold)
                                .foregroundStyle(.highlightWhite)
                        }
                        .padding(10)
                        .background(.primaryGreen)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .frame(width: 160)
                    }
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    UserProfile(callback: {})
}
