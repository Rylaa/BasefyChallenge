//
//  SearchRepositories.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
//{
//    "total_count": 16396,
//    "incomplete_results": false,
//    "items": [
//    {
//    "id": 892275,
//    "node_id": "MDEwOlJlcG9zaXRvcnk4OTIyNzU=",
//    "name": "retrofit",
//    "full_name": "square/retrofit",
//    "private": false,

//    "owner": {
//    "login": "square",
//    "id": 82592,
//    "node_id": "MDEyOk9yZ2FuaXphdGlvbjgyNTky",
//    "avatar_url": "https://avatars0.githubusercontent.com/u/82592?v=4",
//    "gravatar_id": "",
//
//    },
//    "html_url": "https://github.com/square/retrofit",
//    "description": "Type-safe HTTP client for Android and Java by Square, Inc.",
//
//    "url": "https://api.github.com/repos/square/retrofit",
//
//    "homepage": "http://square.github.io/retrofit/",
//
//
//
//    },
//    ]}
struct SearchRepositories : Decodable {
    public let items      : [Items]
}
struct Items : Decodable {
    enum CodingKeys: String, CodingKey {
        case repoName       = "name"
        case forks
        case branchName     = "default_branch"
        case language
        case owner
    }
    let repoName       : String
    let forks          : Int
    let branchName     : String?
    let language       : String?
    let owner          : Owner
}
struct Owner : Decodable {
    enum CodingKeys: String, CodingKey {
        case username       = "login"
        case profileImage   = "avatar_url"
        case gravatar_id
        case userProfileUrl = "url"
        case userReposUrl   = "repos_url"
    }
    let username        : String
    let profileImage    : String
    let gravatar_id     : String?
    let userProfileUrl  : String
    let userReposUrl    : String
}
