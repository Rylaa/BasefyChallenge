//
//  UserProfile.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Foundation
struct UserProfile : Decodable {
    enum CodingKeys: String, CodingKey {
        case userName      = "login"
        case userProfilImg = "avatar_url"
        case userRealName  = "name"
        case email
        case location
    }
    let userName       : String
    let userProfilImg  : String
    let userRealName   : String?
    let email          : String?
    let location       : String?
}
