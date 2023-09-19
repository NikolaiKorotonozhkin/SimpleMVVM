//
//  Users.swift
//  SimpleMVVM
//
//  Created by Nikolai  on 19.09.2023.
//

import Foundation

struct Users: Codable {
    let name: String
    let username: String
    let email: String
    let address: Address
    let phone: String
}

struct Address: Codable {
    let street: String
    let suite: String
    let city: String
    
}

//// MARK: - WelcomeElement
//struct WelcomeElement: Codable {
//    let id: Int
//    let name, username, email: String
//    let address: Address
//    let phone, website: String
//    let company: Company
//}
//
//// MARK: - Address
//struct Address: Codable {
//    let street, suite, city, zipcode: String
//    let geo: Geo
//}
//
//// MARK: - Geo
//struct Geo: Codable {
//    let lat, lng: String
//}
//
//// MARK: - Company
//struct Company: Codable {
//    let name, catchPhrase, bs: String
//}
//
//typealias Welcome = [WelcomeElement]
