//
//  UserProfileService.swift
//  Basefy-Challenge
//
//  Created by Yusuf DEMİRKOPARAN on 21.05.2019.
//  Copyright © 2019 Yusuf DEMİRKOPARAN. All rights reserved.
//
import Alamofire
final class UserProfileService {
    static func getUserDetail(with url: String, completion: @escaping (ServiceResult<UserProfile>)-> Void){
        let escapedEndpoint = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        guard let strongUrl = escapedEndpoint else { return }
        AF.request(strongUrl).responseData { (DataResponse) in
            switch DataResponse.result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let res = try decoder.decode(UserProfile.self, from: data)
                    completion(.success(res))
                } catch let err{
                    let responseErr = String(describing: ServiceError.serializationError(internal: err))
                    AlertService.SerializationAlert(title: "Serialization Error!", error: responseErr)
                    completion(.failure(err))
                }
            case .failure(let err):
                let responseErr = String(describing: err)
                AlertService.SerializationAlert(title: "Data Response Error!", error: responseErr)
            }
        }
    }
}
