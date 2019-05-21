//
//  UserProfile.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
//{
//    "login": "JakeWharton",
//    "id": 66577,
//    "node_id": "MDQ6VXNlcjY2NTc3",
//    "avatar_url": "https://avatars0.githubusercontent.com/u/66577?v=4",
//    "gravatar_id": "",
//    "url": "https://api.github.com/users/JakeWharton",
//    "html_url": "https://github.com/JakeWharton",
//    "followers_url": "https://api.github.com/users/JakeWharton/followers",
//    "following_url": "https://api.github.com/users/JakeWharton/following{/other_user}",
//    "gists_url": "https://api.github.com/users/JakeWharton/gists{/gist_id}",
//    "starred_url": "https://api.github.com/users/JakeWharton/starred{/owner}{/repo}",
//    "subscriptions_url": "https://api.github.com/users/JakeWharton/subscriptions",
//    "organizations_url": "https://api.github.com/users/JakeWharton/orgs",
//    "repos_url": "https://api.github.com/users/JakeWharton/repos",
//    "events_url": "https://api.github.com/users/JakeWharton/events{/privacy}",
//    "received_events_url": "https://api.github.com/users/JakeWharton/received_events",
//    "type": "User",
//    "site_admin": false,
//    "name": "Jake Wharton",
//    "company": "Google, Inc.",
//    "blog": "http://jakewharton.com",
//    "location": "Pittsburgh, PA, USA",
//    "email": null,
//    "hireable": null,
//    "bio": null,
//    "public_repos": 102,
//    "public_gists": 54,
//    "followers": 52876,
//    "following": 12,
//    "created_at": "2009-03-24T16:09:53Z",
//    "updated_at": "2019-04-29T18:26:17Z"
//}
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
