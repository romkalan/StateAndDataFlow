//
//  StorageManager.swift
//  StateAndDataFlow
//
//  Created by Roman Lantsov on 28.04.2023.
//

import SwiftUI

final class StorageManager: ObservableObject {
    @AppStorage("isLoggedIn") var isLoggedIn = false {
        didSet { objectWillChange.send() }
    }
    
    @AppStorage("name") var name = "" {
        didSet { objectWillChange.send() }
    }
}
