//
//  SearchRepositories.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Foundation
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
