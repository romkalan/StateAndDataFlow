//
//  UserSettings.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import Foundation
import SwiftUI

final class UserSettings: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn = false {
        willSet { objectWillChange.send() }
    }
    
    @AppStorage("name") var name = "" {
        willSet { objectWillChange.send() }
    }
}
