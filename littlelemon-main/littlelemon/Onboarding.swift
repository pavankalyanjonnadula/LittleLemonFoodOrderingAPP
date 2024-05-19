//
//  Onboarding.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 14.05.2024.
//

import SwiftUI

let kFirstName = "kFirstName"
let kLastName = "kLastName"
let kEmail = "kEmail"
let kIsLoggedIn = "kIsLoggedIn"
let kPhone = "kPhone"

struct Onboarding: View {
    // MARK: Properties
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var isLoggedIn: Bool = false
    
    // MARK: View
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(
                    isActive: $isLoggedIn,
                    destination: { Home() }
                ) {
                    EmptyView()
                }
                
                TextField("First Name", text: $firstName).padding()
                TextField("Last Name", text: $lastName).padding()
                TextField("Email", text: $email).padding()
                Button("Register") {
                    if
                        !(firstName.isEmpty &&
                          lastName.isEmpty &&
                          email.isEmpty)
                    {
                        UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: kLastName)
                        UserDefaults.standard.setValue(email, forKey: kEmail)
                        isLoggedIn = true
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                    }
                }
            }
            .onAppear {
                if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
                    isLoggedIn = true
                }
            }
        }
    }
}

#Preview {
    Onboarding()
}
