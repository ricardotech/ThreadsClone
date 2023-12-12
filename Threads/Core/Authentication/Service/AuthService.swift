//
//  AuthService.swift
//  Threads
//
//  Created by Ricardo Fonseca on 11/12/23.
//

import FirebaseAuth
import FirebaseFirestore

class AuthService {
    
    @Published var userSession: FirebaseAuth.User?
    
    static let shared = AuthService()
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email:String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed to login user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email:String, password: String, name: String, username: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            try await uploadUserData(withEmail: email, password: password, name: name, username: username, id: result.user.uid)
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        print("DEBUG: signOut()")
        try? Auth.auth().signOut()
        self.userSession = nil
        UserService.shared.reset()
    }
    
    private func uploadUserData(
        withEmail email:String,
        password: String,
        name: String,
        username: String,
        id: String
    ) async throws {
        let user = User(id: id, name: name, username: username)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentUser = user
    }
}
