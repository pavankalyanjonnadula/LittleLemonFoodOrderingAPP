//
//  littlelemonApp.swift
//  littlelemon
//
//  Created by Alexandr Zhelanov on 12.05.2024.
//

import SwiftUI

@main
struct littlelemonApp: App {
    
    init() {
        for family in UIFont.familyNames.sorted() {
                    let names = UIFont.fontNames(forFamilyName: family)
                    print("Family: \(family) Font names: \(names)")
                }
    }
    
    var body: some Scene {
        WindowGroup {
            Onboarding()
        }
    }
}
