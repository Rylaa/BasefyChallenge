//
//  ServiceResults.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
enum ServiceResult<Value> {
    case success(Value)
    case failure(Error)
}
