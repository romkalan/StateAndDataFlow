//
//  RootView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct RootView: View {
    @StateObject private var storageManager = StorageManager()
    
    var body: some View {
        Group {
            if storageManager.isLoggedIn {
                ContentView()
            } else {
                LoginView()
            }
        }.environmentObject(storageManager)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
