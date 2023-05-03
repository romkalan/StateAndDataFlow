//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var userManager: UserManager
    private let storageManager = StorageManager.shared
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $userManager.user.name)
                    .multilineTextAlignment(.center)
                Text(countLetters(in: userManager.user.name).formatted())
                    .foregroundColor(userManager.nameIsValide ? .green : .red)
            }
            Button(action: registerUser) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("Ok")
                }
                .disabled(!userManager.nameIsValide)
            }
        }
        .padding()
    }
    
    private func countLetters(in name: String) -> Int {
        name.filter { $0 != " " }.count
    }
    
    private func registerUser() {
        userManager.user.isLoggedIn.toggle()
        storageManager.save(user: userManager.user)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
