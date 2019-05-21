//
//  UserProfileTableCell.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
class UserProfileTableCellS1 : UITableViewCell {
    let imageSize : CGFloat = UIScreen.main.bounds.width*0.25
    lazy var location : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textColor                 = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 1
        return lbl
    }()
    lazy var email : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textColor                 = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 1
        return lbl
    }()

    lazy var realName : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 18, weight: .bold)
        lbl.textColor                 = .black
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 1
        return lbl
    }()
    lazy var userProfilImage : UIImageView = {
        let img = UIImageView()
        img.layer.cornerRadius = self.imageSize/2
        img.clipsToBounds = true
        img.layer.masksToBounds = true
        img.layer.borderColor = UIColor.darkGray.cgColor
        img.layer.borderWidth = 1
        img.contentMode = UIView.ContentMode.scaleAspectFit
        return img
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(userProfilImage)
        self.addSubview(realName)
        self.addSubview(email)
        self.addSubview(location)
        
        userProfilImage.centerY(to: self)
        userProfilImage.right(to: self, offset: -30)
        userProfilImage.width(imageSize)
        userProfilImage.height(imageSize)
        
        realName.rightToLeft(of: userProfilImage)
        realName.left(to: self, offset:+35)
        realName.centerY(to: self, offset:-10)
        
        email.topToBottom(of: realName)
        email.left(to: self, offset : +35)
        
        location.topToBottom(of: email)
        location.left(to: self, offset : +35)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
