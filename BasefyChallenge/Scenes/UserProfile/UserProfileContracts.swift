//
//  UserProfileContracts.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
protocol UserProfileProtocol {
    var delegate : UserProfileDelegate? { get set  }
    func load()
    func loadRepositories()
}
enum userProfileOutputs {
    case pageTitle(String)
    case isLoading(Bool)
    case userProfileDetail(UserProfilePresentation)
    case userRepoDetail([UserRepositoriesPresentation])
}
protocol UserProfileDelegate: class {
    func handleViewModelOutputs(_ output: userProfileOutputs)
}
