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
                self.presenter?.fetchedWeatherFailed(error: "Error")
            } else {
                guard let dto = DTO else { return }
                self.fetchWeatherDetail(info: dto)
            }
        }
        
    }
    
    private func fetchWeatherDetail(info : WeatherResponse){
        
        guard let url = info.datos else { return }
        DynamicVariables.Networking.Url.weather_detail = url
        
        APIClient.getDetailWeather { (DTO, error) in
            if error != nil {
                self.presenter?.fetchedWeatherFailed(error: "Error")
            } else {
                guard let dto = DTO else { return }
                self.presenter?.fetchedWeatherSuccess(data: dto)
            }
        }
        
    }
}
