//
//  WeatherInteractor.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class WeatherInteractor: WeatherPresenterToInteractorProtocol{
    
    var presenter: WeatherInteractorToPresenterProtocol?

    func fetchWeather() {
        APIClient.getDefaultWeather { (DTO, error) in
            if error != nil {
                print("Error: ", error!)
            } else {
                print("DTO: ", DTO!)
            }
        }
    }
}
