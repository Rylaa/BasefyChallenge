//
//  UserRepositoriesViewController.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import TinyConstraints
class RepositoryDetailViewController : UIViewController {
    let imageSize : CGFloat = UIScreen.main.bounds.width*0.3
    var userProfilImage = UIImageView()
    var repoName = UILabel()
    var userName = UILabel()
    var Language = UILabel()
    var branch   = UILabel()
    var forks    = UILabel()
    var viewModel : RepositoryDetailsProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        setupLayout()
    }
    
    fileprivate func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(userProfilImage)
        view.addSubview(repoName)
        view.addSubview(userName)
        view.addSubview(Language)
        view.addSubview(branch)
        view.addSubview(forks)
        userProfilImage.layer.cornerRadius = self.imageSize/2
        userProfilImage.clipsToBounds = true
        userProfilImage.layer.masksToBounds = true
        userProfilImage.layer.borderColor = UIColor.darkGray.cgColor
        userProfilImage.layer.borderWidth = 1
        userProfilImage.contentMode = UIView.ContentMode.scaleAspectFit
        repoName.font = UIFont.systemFont(ofSize: 20)
        repoName.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        userName.font = UIFont.systemFont(ofSize: 20)
        userName.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        Language.font = UIFont.systemFont(ofSize: 20)
        Language.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        branch.font   = UIFont.systemFont(ofSize: 20)
        branch.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        forks.font   = UIFont.systemFont(ofSize: 20)
        forks.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        
        
        
        userProfilImage.top(to: view, offset: view.frame.height*0.2)
        userProfilImage.centerX(to: view)
        userProfilImage.width(imageSize)
        userProfilImage.height(imageSize)
        
        repoName.topToBottom(of: userProfilImage, offset: +50)
        
        repoName.left(to: view, offset: 30)
        
        userName.topToBottom(of: repoName)
        userName.left(to: view, offset: 30)
        
        Language.topToBottom(of: userName)
        Language.left(to: view, offset:30)
        
        branch.topToBottom(of: Language)
        branch.left(to: view, offset:30)
        
        forks.topToBottom(of: branch)
        forks.left(to: view,offset:30)
        
        
    }
}
extension RepositoryDetailViewController : RepositoryDetailDelegate {
    func handleViewModelOutputs(presentation: SearchPresentation) {
        userProfilImage.kf.setImage(with: URL(string:presentation.profilimage ))
        self.repoName.text = "Repository: \( presentation.repoName)"
        self.userName.text = "Name:\(presentation.username)"
        self.forks.text    = "Forks:\(String(presentation.forks))"
        if let str = presentation.language {
            self.Language.text = "Language:\(str)"
        }
        if let branchMaster = presentation.branchName {
            self.branch.text   = "Default Branch:\(branchMaster)"
        }
        
    }
}
