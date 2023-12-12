//
//  RegistrationViewModel.swift
//  Threads
//
//  Created by Ricardo Fonseca on 11/12/23.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var username = ""
    
    @MainActor
    func createUser() async throws {
        try await AuthService.shared.createUser(
            withEmail: email,
            password: password,
            name: name,
            username: username
        )
    }
}
