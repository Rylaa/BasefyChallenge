//
//  SearchRepositoriesVC.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//

import UIKit
import TinyConstraints
class SearchRepositoriesViewController : UITableViewController {
    //MARK: - Properties
    var viewModel : SearchRepositoriesProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    var searchList   : [SearchPresentation] = []
    var searchPagination  : [SearchPresentation] = []
    let cellID           = "cell"
    var searchController = UISearchController(searchResultsController: nil)
    var limit            = 6
    let isActivity = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.gray)
    var showMore = true
    //MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewSetup()
        setupNavBar()
    }
    fileprivate func setupNavBar(){
        self.title = "Search Repositories"
        self.navigationItem.largeTitleDisplayMode = .always
        self.navigationController?.navigationBar.prefersLargeTitles = true
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Type here Repo name.."
        navigationItem.searchController = searchController
        definesPresentationContext = true
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    fileprivate func tableviewSetup() {
        tableView.register(SearchRepositoriesTableCell.self, forCellReuseIdentifier: cellID)
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchPagination.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! SearchRepositoriesTableCell
        let imgUrl = URL(string: searchPagination [indexPath.row].profilimage)
        cell.userProfilImage.kf.setImage(with: imgUrl)
        cell.userNameLabel.text = searchPagination [indexPath.row].username
        cell.repoNameLabel.text = searchPagination [indexPath.row].repoName
        cell.profilPhotoView.tag = indexPath.row
        let labelTapGesture = UITapGestureRecognizer(target:self,action:#selector(doSomethingOnTap(_:)))
        cell.profilPhotoView.addGestureRecognizer(labelTapGesture)
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height*0.15
    }
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let content = (scrollView.contentSize.height - scrollView.frame.size.height)
        if showMore {
            if ( offset < content)
            {
                if searchPagination.count < searchList.count {
                    showMore = false
                    var index = searchPagination.count
                    limit = index + 5
                    while index < limit && index < searchList.count {
                        searchPagination .append(searchList[index])
                        index+=1
                    }
                    self.perform(#selector(relodData), with: nil, afterDelay: 2.0)
                }
            }
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectedIndex(at: indexPath.row)
    }
    @objc func relodData(){
        tableView.reloadData()
        showMore = true
    }
    @objc func doSomethingOnTap(_ sender: UITapGestureRecognizer) {
        let selectedCell = searchPagination[(sender.view?.tag)!]
        viewModel.selectedAvatar(selectedCell: selectedCell)
    }
}
//MARK: - Handlers
extension SearchRepositoriesViewController : UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchController.dismiss(animated: true, completion: nil)
        guard let strongSelf = searchBar.text else { return }
        viewModel.searchParamter(with: strongSelf)
        viewModel.load()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.lengthOfBytes(using: .utf8) == 0 {
            searchList.removeAll()
            searchPagination.removeAll()
            tableView.reloadData()
        }
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchList.removeAll()
        searchPagination.removeAll()
        tableView.reloadData()
    }
}
extension SearchRepositoriesViewController : SearchRepositoriesDelegate {
    func handleViewModelOutputs(_ outputs: viewModelOutputs) {
        switch outputs {
        case .isLoading(let isLoading):
            activitySetup(isloading: isLoading)
        case .SearchRepositoriesList(let searchList):
            self.searchList = searchList
            searchPagination .removeAll()
            limit = 6
            if searchList.count > limit {
                    let array = Array(searchList.prefix(limit))
                    searchPagination = array
            } else {
                searchPagination  = searchList
            }
            tableView.reloadData()
        }
    }
    func navigate(_ route: viewContracts) {
        switch route {
        case .Userdetail(let viewModel):
            let controller = UserProfileBuilder.make(viewModel: viewModel)
            show(controller, sender: nil)
        //TODO: Implement
        case .repositoryDetail(let viewModel):
            let controller = RepositoryDetailBuilder.make(viewModel: viewModel)
            show(controller, sender: nil)
        }
    }
}
