//
//  Error.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import Foundation
enum ServiceError : Swift.Error {
    case serializationError(internal: Swift.Error)
}
