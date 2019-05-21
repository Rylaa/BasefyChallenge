//
//  Search RepositoriesBuilder.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
final class SearchRepositoriesBuilder {
    static func make()->SearchRepositoriesViewController{
        let controller = SearchRepositoriesViewController()
        controller.viewModel = SearchRepositoriesViewModel()
        return controller
    }
}
