//
//  UserRepositoriesBuilder.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

final class RepositoryDetailBuilder {
    static func make(viewModel: RepositoryDetailsProtocol)->RepositoryDetailViewController {
    let controller = RepositoryDetailViewController()
    controller.viewModel = viewModel
    return controller
    }
}
