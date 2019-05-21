//
//  AlertService.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 20.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class AlertService {
    static func SerializationAlert(title: String, error: String ) {
        let ac = UIAlertController.init(title: title,
                                        message: error,
                                        preferredStyle: .alert)
        let action = UIAlertAction.init(title: "OK!", style: .cancel, handler: nil)
        ac.addAction(action)
        UIApplication.shared.keyWindow?.rootViewController?.present(ac, animated: true, completion: nil)
    }

}
