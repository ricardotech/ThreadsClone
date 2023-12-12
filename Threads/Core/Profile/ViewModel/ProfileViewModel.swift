//
//  ProfileViewModel.swift
//  Threads
//
//  Created by Ricardo Fonseca on 12/12/23.
//

import Foundation
import Combine

class ProfileViewModel: ObservableObject {
    @Published var currentUser: User?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User from View Model")
        }.store(in: &cancellables)
    }
}
