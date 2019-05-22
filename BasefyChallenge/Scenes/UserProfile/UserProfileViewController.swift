//
//  UserProfileViewController.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit

class UserProfileViewController : UITableViewController {
    // MARK: - Properties
    var viewModel : UserProfileProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    let cellID  = "cell1"
    let cellID2 = "cell2"
    var userRepositories : [UserRepositoriesPresentation] = []
    var userPagination  : [UserRepositoriesPresentation] = []
    var limit = 5
    let isActivity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var presentation : UserProfilePresentation?
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.load()
        viewModel.loadRepositories()
        tableviewSetup()
    }
    // MARK: - Handlers
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = section == 0 ? 1 : userPagination.count
        return count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && presentation?.userName != nil {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! UserProfileTableCellS1
            let imgURL = URL(string: presentation!.userProfilImg)
            cell.userProfilImage.kf.setImage(with: imgURL)
            cell.realName.text = presentation?.userRealName
            cell.email.text    = presentation?.email
            cell.location.text = presentation?.location
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID2, for: indexPath) as! UserProfileTableCellS2
            if userRepositories.count > 0 {
                cell.repoName.text = userPagination[indexPath.row].name
                cell.repoDesc.text = userPagination[indexPath.row].jsonDescription
            }
            return cell
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return view.frame.height*0.2
        } else {
            return view.frame.height*0.1
        }
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == userPagination.count-1 && indexPath.section == 1 {
            if userRepositories.count>userPagination.count && userPagination.count>limit {
                var index = userPagination.count
                limit = index+5
                while  index < limit && index < userRepositories.count {
                    userPagination.append(userRepositories[index])
                    index+=1
                }
                self.perform(#selector(reloadData), with: nil, afterDelay: 2.0)
            }
        }
    }
    @objc func reloadData(){
        tableView.reloadData()
    }
    fileprivate func tableviewSetup() {
        tableView.register(UserProfileTableCellS1.self, forCellReuseIdentifier: cellID)
        tableView.register(UserProfileTableCellS2.self, forCellReuseIdentifier: cellID2)
        tableView.tableFooterView = UIView(frame: .zero)
    }
    fileprivate func activitySetup(isloading: Bool) {
        isActivity.hidesWhenStopped = true
        if isloading {
            isActivity.startAnimating()
        } else {
            isActivity.stopAnimating()
        }
        view.addSubview(isActivity)
        isActivity.top(to: view, offset:view.frame.height*0.3)
        isActivity.centerX(to: view)
    }
}
extension UserProfileViewController : UserProfileDelegate {
    func handleViewModelOutputs(_ output: userProfileOutputs) {
        switch output {
        case .isLoading(let isloading):
            activitySetup(isloading: isloading)
        case .pageTitle(let pageTitle):
            self.title = pageTitle
        case .userProfileDetail(let presentation):
            self.presentation = presentation
        case .userRepoDetail(let userRepositories):
            self.userRepositories = userRepositories
            userPagination.removeAll()
            limit = 5
            if self.userRepositories.count > limit {
                let range = userRepositories.prefix(limit)
                userPagination = Array(range)
            } else {
                userPagination = userRepositories
            }
            tableView.reloadData()
        }
    }
}
