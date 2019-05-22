//
//  SearchPresentation-API.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Foundation
extension SearchPresentation {
    init(service : Items) {
        self.repoName       = service.repoName
        self.profilimage    = service.owner.profileImage
        self.username       = service.owner.username
        self.userProfileUrl = service.owner.userProfileUrl
        self.userReposUrl   = service.owner.userReposUrl
        self.branchName     = service.branchName
        self.forks          = service.forks
        self.language       = service.language  
    }
}
