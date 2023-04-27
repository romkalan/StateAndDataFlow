//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var lettersCounter = 0
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                Text(lettersCounter.formatted())
                    .foregroundColor(.red)
            }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
            }
        }
        .padding()
    }
    
    private func login() {
        if !name.isEmpty {
            userSettings.name = name
            userSettings.isLoggedIn.toggle()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
