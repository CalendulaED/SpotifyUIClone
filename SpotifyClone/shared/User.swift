//
//  User.swift
//  SpotifyClone
//
//  Created by Yuxuan Wu on 5/20/24.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height: Double
    let weight: Double
    
    static var mock: User {
        User(
            id: 144,
            firstName: "Awu",
            lastName: "W",
            age: 24,
            email: "w@gmail.com",
            phone: "123",
            username: "awu",
            password: "123",
            image: Constants.randomImage,
            height: 188,
            weight: 83
        )
    }
}
