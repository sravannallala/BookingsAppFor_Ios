//
//  User.swift
//  BookingApp
//
//  Created by Zenchef on 03/05/2021.
//  Copyright © 2021 zenchef. All rights reserved.
//

import Foundation

struct User {
    var firstName: String = "John"
    var lastName: String = "Doe"
    var gender: Gender = .male
    var email: String?
    var phone: String?
    var fullname : String {
        return firstName + " " + lastName
    }
    
}

enum Gender: String, Codable {
    case male
    case female
}

struct UserName: Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct UserResultList: Codable {
    let results: [Results]?
    let info: Info?
}

struct Results: Codable {
    let gender: Gender?
    let name: UserName?
    let location: Location?
    let email: String?
    let login: Login?
    let dob: Dob?
    let registered: Registered?
    let phone: String?
    let cell: String?
    let id: UserId?
    let picture: Picture?
    let nat: String?
}

struct Location: Codable {
    let street: Street?
    let city: String?
    let state: String?
    let country: String?
    let coordinates: Coordinates?
    let timezone: Timezone?
}

struct Coordinates: Codable {
    let latitude: String?
    let longitude: String?
}

struct Dob: Codable {
    let date: String?
    let age: Int?
}

struct UserId: Codable {
    let name: String?
    let value: String?
}

struct Info: Codable {
    let seed: String?
    let results: Int?
    let page: Int?
    let version: String?
}

struct Login: Codable {
    let uuid: String?
    let username: String?
    let password: String?
    let salt: String?
    let md5: String?
    let sha1: String?
    let sha256: String?
}

struct Name: Codable {
    let title: String?
    let first: String?
    let last: String?
}

struct Picture: Codable {
    let large: String?
    let medium: String?
    let thumbnail: String?
}


struct Registered: Codable {
    let date: DateWithFormat<Format1>?
    let age: Int?
}

struct Street: Codable {
    let number: Int?
    let name: String?
}

struct Timezone: Codable {
    let offset: String?
    let description: String?
}
