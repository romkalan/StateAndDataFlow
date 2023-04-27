//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @State private var name = ""
    @State private var color = Color.red
    @State private var isActivated = true
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
                    .onChange(of: name) { newValue in
                        color = newValue.count >= 3 ? .green : .red
                        isActivated = newValue.count >= 3 ? false : true
                    }
                Text(name.count.formatted())
                    .foregroundColor(color)
            }
            Button(action: login) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(isActivated)
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
