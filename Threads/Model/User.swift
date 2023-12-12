//
//  User.swift
//  Threads
//
//  Created by Ricardo Fonseca on 12/12/23.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let name: String
    let username: String
    var profileImageUrl: String?
    var bio: String?
}
