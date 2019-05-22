//
//  UserRepositoriesViewModel.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
final class RepositoryDetailViewModel : RepositoryDetailsProtocol {
    // MARK: - Properties
    weak var delegate: RepositoryDetailDelegate?
    let presentation : SearchPresentation
    // MARK: - Init
    init(presentation : SearchPresentation) {
        self.presentation = presentation
    }
    // MARK: - Handlers
    func load() {
        delegate?.handleViewModelOutputs(presentation: presentation)
    }
}
