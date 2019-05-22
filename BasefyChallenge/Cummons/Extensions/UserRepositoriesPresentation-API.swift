//
//  UserRepositoriesPresentation-API.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
extension  UserRepositoriesPresentation {
    init(service : Repositories) {
        self.avatarURL       = service.owner.avatarURL
        self.fullName        = service.fullName
        self.jsonDescription = service.jsonDescription
        self.login           = service.owner.login
        self.url             = service.owner.url
        self.name            = service.name
    }
}
