//
//  SearchRepositoriesService.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//s
import Alamofire
final class SearchRepositoriesService {
    static func getSearchItems(with searchParamter: String, completion: @escaping (ServiceResult<SearchRepositories>)->Void){
        let urlString = "https://api.github.com/search/repositories?q=\(searchParamter)"
        let escapedEndpoint = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let endpoint = escapedEndpoint else { return }
        AF.request(endpoint).responseData { (DataResponse) in
            switch DataResponse.result {
            case.success(let data):
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(SearchRepositories.self, from: data)
                    completion(.success(res))
                } catch let err {
                    let responseErr = String(describing: ServiceError.serializationError(internal: err))
                    AlertService.SerializationAlert(title: "Serialization Error!", error: responseErr)
                    completion(.failure(err))
                }
            case.failure(let err):
                let responseErr = String(describing: err)
                AlertService.SerializationAlert(title: "Data Response Error!", error: responseErr)
            }
        }
    }
}
