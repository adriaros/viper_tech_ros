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
        performRequest(type: .string, serviceRouter: APIRouter.getWeather(), decoder: JSONDecoder(), dto: WeatherResponse.self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
    
    static func getDetailWeather(completion: @escaping ([WeatherDetailResponse]?,Error?)->Void){
        performRequest(type: .json, serviceRouter: APIRouter.getDetailWeather(), decoder: JSONDecoder(), dto: [WeatherDetailResponse].self) { (response) in
            switch response {
            case .failure(let error):
                completion(nil,error)
            case .success(let data):
                completion(data, nil)
            }
        }
    }
    
}
