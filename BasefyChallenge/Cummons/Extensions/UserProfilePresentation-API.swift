//
//  UserProfilePresentation-API.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Foundation
extension UserProfilePresentation {
    init(service: UserProfile) {
        self.email         = service.email
        self.userName      = service.userName
        self.userProfilImg = service.userProfilImg
        self.userRealName  = service.userRealName
        self.location      = service.location
    }
}
