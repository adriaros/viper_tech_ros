//
//  SelectorServices.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/21/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

extension APIClient {
    
    static func getDefaultList(completion: @escaping (SelectorListResponse?,Error?)->Void){
        performRequest(serviceRouter: APIRouter.getDefaultList(), decoder: JSONDecoder(), dto: SelectorListResponse.self) { (response) in
            switch response {
                
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
    
    static func getSearchList(completion: @escaping (SelectorListResponse?,Error?)->Void){
        performRequest(serviceRouter: APIRouter.getSearchList(), decoder: JSONDecoder(), dto: SelectorListResponse.self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
    
}
