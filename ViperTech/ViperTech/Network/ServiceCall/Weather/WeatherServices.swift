//
//  WeatherServices.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation

extension APIClient {

    static func getDefaultWeather(completion: @escaping (WeatherResponse?,Error?)->Void){
        performRequest(serviceRouter: APIRouter.getWeather(), decoder: JSONDecoder(), dto: WeatherResponse.self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
    
}
