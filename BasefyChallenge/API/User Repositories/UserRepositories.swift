//
//  UserRepositories.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
typealias UserRepositories = [Repositories]
struct Repositories: Codable {
    let name, fullName : String?
    let owner          : Owner2
    let htmlURL        : String?
    let jsonDescription: String?
    enum CodingKeys: String, CodingKey {
        case name
        case fullName = "full_name"
        case owner
        case htmlURL = "html_url"
        case jsonDescription = "description"
    }
}
struct Owner2: Codable {
    let login      : String?
    let nodeID     : String
    let avatarURL  : String
    let gravatarID : String?
    let url        : String
    enum CodingKeys: String, CodingKey {
        case login
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
    }
}


