//
//  UserDefaultsSettings.swift
//  StateAndDataFlow
//
//  Created by Roman Lantsov on 28.04.2023.
//

import Foundation

class UserDefaultsSettings: ObservableObject {
    
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "isLoggedIn") {
        didSet {
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
        }
    }
    var name: String = UserDefaults.standard.string(forKey: "name") ?? "" {
        didSet {
            UserDefaults.standard.set(name, forKey: "name")
        }
    }
}
