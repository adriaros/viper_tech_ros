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
    
    enum ResponseType : String {
        case json
        case string
    }
    
    private static var Manager: Alamofire.SessionManager = {
        var serverTrustPolicies: [String: ServerTrustPolicy] = [:]
        serverTrustPolicies = ["opendata.aemet.es": .disableEvaluation]
        
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        
        let manager = Alamofire.SessionManager(configuration: URLSessionConfiguration.default,
                                               serverTrustPolicyManager: ServerTrustPolicyManager(policies: serverTrustPolicies)
        )
        return manager
    }()
    
    static func performRequest<T:Decodable>(type: ResponseType, serviceRouter:APIRouter, decoder: JSONDecoder,dto: T.Type, completion:@escaping (Alamofire.Result<T>)->Void){
        
        let manager = Manager
        
        switch type {
        case .json:
            
            manager.request(serviceRouter).responseJSON { (response) in
                switch(response.result){
                    
                case .success:
                    do{
                        let jsonDecoder = JSONDecoder()
                        guard let secureResponse = response.data else { return }
                        let dtoObject = try jsonDecoder.decode(dto.self, from: secureResponse)
                        completion(Alamofire.Result.success(dtoObject))
                    }catch _{
                        completion(Alamofire.Result.failure(ApiError.jsonConversion))
                    }
                    
                case .failure:
                    completion(Alamofire.Result.failure(ApiError.failedPostCall))
                }
            }
            
        case .string:
            
            manager.request(serviceRouter).responseString { (response) in
                
                switch(response.result){
                    
                case .success:
                    do{
                        let jsonDecoder = JSONDecoder()
                        guard let secureResponse = response.result.value?.data(using: .utf8) else { return }
                        let dtoObject = try jsonDecoder.decode(dto.self, from: secureResponse)
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
    
}
