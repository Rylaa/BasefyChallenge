//
//  UserProfileBuilder.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Foundation
final class UserProfileBuilder {
    static func make(viewModel: UserProfileProtocol)->UserProfileViewController {
        let controller = UserProfileViewController()
        controller.viewModel = viewModel
        return controller
    }
}
