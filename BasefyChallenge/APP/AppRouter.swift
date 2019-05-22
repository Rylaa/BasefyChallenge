//
//  AppRouter.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import UIKit
final class AppRouter {
    var window : UIWindow?
    func start() {
        let controller = SearchRepositoriesBuilder.make()
        let rootController = UINavigationController(rootViewController: controller)
        window = UIWindow()
        window?.rootViewController = rootController
        window?.makeKeyAndVisible()
    }
}
