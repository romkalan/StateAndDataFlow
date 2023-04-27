//
//  ContentView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 26.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var buttonTitleForLogOut = "LogOut"
    @StateObject private var timer = TimeCounter()
    @EnvironmentObject private var userSettings: UserSettings
    
    var body: some View {
        VStack {
            Text("Hi, \(userSettings.name)")
                .font(.largeTitle)
                .padding(.top, 100)
            Text(timer.counter.formatted())
                .font(.largeTitle)
                .padding(.top, 100)
            Spacer()
            
            ButtonView(name: $timer.buttonTitle, color: .red, action: timer.startTimer)
            
            Spacer()
            
            ButtonView(name: $buttonTitleForLogOut, color: .blue, action: logOut)
        }
        .padding()
    }
    
    private func logOut() {
        userSettings.name = ""
        userSettings.isLoggedIn.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(UserSettings())
    }
}

struct ButtonView: View {
    @Binding var name: String
    let color: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: action) {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
        }
        .frame(width: 200, height: 60)
        .background(color)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 4)
        )
    }
}
