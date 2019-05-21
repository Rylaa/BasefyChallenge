//
//  UserRepositoriesContracts.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
protocol RepositoryDetailsProtocol {
    var delegate : RepositoryDetailDelegate? { get set }
    func load()
}
protocol RepositoryDetailDelegate : class {
    func handleViewModelOutputs(presentation : SearchPresentation)
}
