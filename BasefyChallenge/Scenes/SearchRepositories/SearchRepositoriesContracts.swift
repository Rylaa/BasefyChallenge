//
//  SearchRepositoriesContracts.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation

protocol SearchRepositoriesProtocol {
    var delegate : SearchRepositoriesDelegate? { get set }
    func searchParamter(with paramter: String)
    func load()
    func selectedIndex(at Index: Int)
    func selectedAvatar(selectedCell : SearchPresentation)
}

enum viewModelOutputs {
    case isLoading(Bool)
    case SearchRepositoriesList([SearchPresentation])
}
enum viewContracts {
    case Userdetail(UserProfileProtocol)
    case repositoryDetail(RepositoryDetailsProtocol)
}
protocol SearchRepositoriesDelegate : class {
    func handleViewModelOutputs(_ outputs:viewModelOutputs)
    func navigate(_ route: viewContracts)
}
