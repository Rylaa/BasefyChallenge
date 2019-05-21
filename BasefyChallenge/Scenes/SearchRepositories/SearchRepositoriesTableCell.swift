//
//  SearchRepositoriesTableCell.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 20.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import Kingfisher
import TinyConstraints

class SearchRepositoriesTableCell : UITableViewCell {
    let imageSize : CGFloat = UIScreen.main.bounds.width*0.18
    lazy var repoNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lbl.numberOfLines = 1
        lbl.sizeToFit()
        return lbl
    }()
    lazy var userNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        lbl.textAlignment = .center
        lbl.textColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lbl.numberOfLines = 0
        lbl.sizeToFit()
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
    
    lazy var profilPhotoView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = self.imageSize/2
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(profilPhotoView)
        profilPhotoView.addSubview(userProfilImage)
        
        self.addSubview(userNameLabel)
        self.addSubview(repoNameLabel)
        
        profilPhotoView.centerY(to: self)
        profilPhotoView.left(to: self, offset:+20)
        profilPhotoView.width(imageSize)
        profilPhotoView.height(imageSize)
        
        userProfilImage.left(to: profilPhotoView)
        userProfilImage.width(imageSize)
        userProfilImage.height(imageSize)
        
        userNameLabel.centerX(to: self, offset: +10)
        userNameLabel.leftToRight(of: userProfilImage)
        userNameLabel.centerY(to: self, offset: -10)
        
        repoNameLabel.topToBottom(of: userNameLabel)
        repoNameLabel.leftToRight(of: userProfilImage)
        repoNameLabel.centerX(to: self)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
