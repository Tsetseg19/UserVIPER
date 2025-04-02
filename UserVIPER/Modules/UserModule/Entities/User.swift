//
//  Entity.swift
//  UserVIPER
//
//  Created by Enkhtsetseg Unurbayar on 4/2/25.
//

import Foundation


// Entity for a single user
struct User: Codable, Identifiable, Equatable {
    let id: Int
    let email: String
    let first_name: String
    let last_name: String
    let avatar: String
}


// Entity for the API response
struct UserResponse: Codable {
    let page: Int
    let per_page: Int
    let total: Int
    let total_pages: Int
    let data: [User]
}
