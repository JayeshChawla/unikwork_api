//
//  Data.swift
//  Unikwor_Api
//
//  Created by Quick tech  on 23/10/24.
//

import Foundation

struct Data: Codable {
    let user: User
    let images: [String]
    let likes: Int
    let descriptions: String
    let date_time: String
}

struct User: Codable {
    let name: String
    let profile: String
}

