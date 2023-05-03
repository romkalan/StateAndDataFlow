//
//  UserManager.swift
//  StateAndDataFlow
//
//  Created by Roman Lantsov on 03.05.2023.
//

import Combine

final class UserManager: ObservableObject {
    @Published var user = User()

    var nameIsValide: Bool {
        user.name.count >= 3
    }
    
    init() {}
    
    init(user: User) {
        self.user = user
    }
}
