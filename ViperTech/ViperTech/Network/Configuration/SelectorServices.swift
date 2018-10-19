//
//  SelectorServices.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

extension APIClient {
    
    static func getDefaultList(completion: @escaping (SelectorListResponse?,Error?)->Void){
        
        performRequest(serviceRouter: APIRouter.getDefaultList(), decoder: JSONDecoder(), dto: SelectorListResponse.self) { (response) in
            
            let vc = UIApplication.topViewController()
            vc?.showLoader()
            
            switch response {
                
            case .failure(let error):
                completion(nil,error)
                vc?.hideLoader()
            case .success(let data):
                completion(data, nil)
                vc?.hideLoader()
            }
        }
    }
    
}
