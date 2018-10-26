//
//  APIRouter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation
import Alamofire

enum APIRouter : APIConfiguration {
    
    case getDefaultList()
    case getSearchList()
    case getWeather()
    
    //HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getDefaultList:
            return .get
        case .getSearchList():
            return .get
        case .getWeather():
            return .get
        }
    }
    
    //Path
    var path: String {
        switch self {
        case .getDefaultList:
            return Constants.Networking.Url.base_url + Constants.Networking.Url.default_search
        case .getSearchList():
            return Constants.Networking.Url.base_url + Constants.Networking.Url.item_search
        case .getWeather():
            return Constants.Networking.Url.weather_url + Constants.Networking.Key.api_key
        }
    }
    
    //Parameters
    var parameters: Parameters? {
        switch self {
        case .getDefaultList():
            return nil
        case .getSearchList():
            return nil
        case .getWeather():
            return nil
        }
    }
    
    //URLRequestConvertible
    func asURLRequest() throws -> URLRequest {
        
        var urlRequest : URLRequest
        
        switch self {
        case .getDefaultList:
            let url = try path.asURL()
            urlRequest = URLRequest(url: url)
        case .getSearchList:
            let url = try path.asURL()
            urlRequest = URLRequest(url: url)
        case .getWeather():
            let url = try path.asURL()
            urlRequest = URLRequest(url: url)
        }
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.acceptType.rawValue)
        
        // Parameters
        if let parameters = parameters {
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
            } catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
        }
        
        //timeout
        urlRequest.timeoutInterval = 5
        
        print(urlRequest)
        return urlRequest
    }
}
