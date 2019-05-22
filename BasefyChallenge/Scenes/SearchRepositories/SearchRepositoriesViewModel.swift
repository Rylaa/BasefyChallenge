//
//  SearchRepositoriesViewModel.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Foundation
final class SearchRepositoriesViewModel : SearchRepositoriesProtocol {
    //MARK: - Properties
    weak var delegate: SearchRepositoriesDelegate?
    private var paramter = ""
    var repositories : [SearchPresentation] = []
    //MARK: - Init
    init() {}
    //MARK: - Handlers
    func load() {
        self.notify(.isLoading(true))
        SearchRepositoriesService.getSearchItems(with: paramter) { [weak self] (ServiceResult) in
            guard let self = self else {return}
            self.notify(.isLoading(false))
            switch ServiceResult {
            case .success(let succ):
                self.repositories = succ.items.map({ SearchPresentation.init(service: $0 )})
             self.notify(.SearchRepositoriesList(self.repositories))
            case.failure(let err):
                print(err)
            }
        }
    }
    fileprivate func notify(_ output: viewModelOutputs){
        delegate?.handleViewModelOutputs(output)
    }
    func searchParamter(with paramter: String) {
        self.paramter = paramter
    }
    func selectedIndex(at Index: Int) {
        let userProfileUrl = repositories[Index].userProfileUrl
        let userReposUrl   = repositories[Index].userReposUrl
        let userName       = repositories[Index].username
        let controller = UserProfileViewModel(userProfileUrl: userProfileUrl,
                                              userRepoUrl   : userReposUrl,
                                              userName      : userName)
        delegate?.navigate(.Userdetail(controller))
    }
    func selectedAvatar(selectedCell: SearchPresentation) {
        let controller = RepositoryDetailViewModel(presentation: selectedCell)
        delegate?.navigate(.repositoryDetail(controller))
    }
    
}
