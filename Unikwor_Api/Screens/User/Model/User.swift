//
//  User.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 24/10/24.
//

import Foundation

struct UserData: Codable {
    let users: [Users]
}

struct Users: Codable {
    let username: String
    let image: String
    let hair: Hair
    let address: Address
    let company: Company
}

struct Hair: Codable {
    let type: String
}

struct Address: Codable {
    let address: String
}

struct Company: Codable {
    let name: String
}

