//
//  APIClient.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation
import Alamofire

class APIClient {
    
    enum ApiError : Error{
        case incorrectParameters
        case failedPostCall
        case jsonConversion
        case tokenExpired
        case emptyResults
    }
    
    private static var Manager: Alamofire.SessionManager = {
        let serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default,
                                               serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()
    
    static func performRequest<T:Decodable>(serviceRouter:APIRouter, decoder: JSONDecoder,dto: T.Type, completion:@escaping (Alamofire.Result<T>)->Void){
        
        let manager = Manager
        
        manager.request(serviceRouter).responseJSON { (response) in
            
            switch(response.result){
                
            case .success:
                do{
                    let jsonDecoder = JSONDecoder()
                    let dtoObject = try jsonDecoder.decode(dto.self, from: response.data!)
                    completion(Alamofire.Result.success(dtoObject))
                }catch _{
                    completion(Alamofire.Result.failure(ApiError.jsonConversion))
                }
                
            case .failure:
                completion(Alamofire.Result.failure(ApiError.failedPostCall))
            }
        }
    }
    
}
