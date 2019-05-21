//
//  UserProfileViewModel.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
import Foundation
final class UserProfileViewModel : UserProfileProtocol {
  
    
    // MARK: - Properties
    weak var delegate: UserProfileDelegate?
    var userProfileUrl : String
    var userRepoUrl    : String
    var userName       : String
    var presentation : UserProfilePresentation?
    var userRepositories : [UserRepositoriesPresentation] = []
    // MARK: - Init
    init(userProfileUrl: String, userRepoUrl: String, userName: String) {
        self.userProfileUrl = userProfileUrl
        self.userRepoUrl    = userRepoUrl
        self.userName       = userName
    }
    // MARK: - Handlerss
    func load() {
        self.notify(.isLoading(true))
        UserProfileService.getUserDetail(with: userProfileUrl) { [weak self] (ServiceResult) in
            guard let self = self else { return }
            self.notify(.isLoading(false))
            self.notify(.pageTitle(self.userName))
            switch ServiceResult {
            case .success(let presentation):
               self.presentation = UserProfilePresentation(service: presentation)
               self.notify(.userProfileDetail(self.presentation!))
            case .failure(let err):
                print(err)
                // TODO: Implement
            }
        }
    }
    func loadRepositories() {
        self.notify(.isLoading(true))
        UserRepositoriesService.getUserRepositories(with: self.userRepoUrl) { [weak self] (ServiceResult) in
            guard let self = self else { return }
            self.notify(.isLoading(false))
            switch ServiceResult {
            case .success(let data):
                self.userRepositories = data.map({ UserRepositoriesPresentation(service: $0) })
                self.notify(.userRepoDetail(self.userRepositories))
            case .failure(let err):
                print(err)
                //TODO: Implement
            }
        }
    }
    fileprivate func notify(_ output: userProfileOutputs){
       delegate?.handleViewModelOutputs(output)
    }
   
}
