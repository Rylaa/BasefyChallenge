//
//  UserProfileTableCellS2.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//



import UIKit
class UserProfileTableCellS2 : UITableViewCell {
    
    lazy var repoName : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 15, weight: .bold)
        lbl.textColor                 = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 1
        lbl.sizeToFit()
        return lbl
    }()
    lazy var repoDesc : UILabel = {
        var lbl                       = UILabel()
        lbl.font                      = UIFont.systemFont(ofSize: 14, weight: .bold)
        lbl.textColor                 = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        lbl.adjustsFontSizeToFitWidth = true
        lbl.numberOfLines             = 0
        lbl.sizeToFit()
        return lbl
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.addSubview(repoName)
        self.addSubview(repoDesc)
        
        repoName.left(to: self, offset:+20)
        repoName.top(to: self,offset: +10)
        
        repoDesc.topToBottom(of: repoName)
        repoDesc.left(to: self, offset:+20)
        repoDesc.right(to: self, offset:-20)
        repoDesc.height(50)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
