//
//  WeatherInteractor.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit
import RealmSwift

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
                self.storeInformation(info: dto)
                self.presenter?.fetchedWeatherSuccess(data: dto)
            }
        }
        
    }
    
    private func storeInformation(info: [WeatherDetailResponse]){
        let realmodel = WeatherRealmModel()
        let prediction = PredictionRealm()
        
        guard let values = info[0].prediccion?.dia?[0].estadoCielo! else { return }
        guard let temperatures = info[0].prediccion?.dia?[0].temperatura! else { return }
        guard let humidities = info[0].prediccion?.dia?[0].humedadRelativa! else { return }
        
        for _ in values {
            
            for value in values {
                prediction.hour = value.periodo
                prediction.sky = value.descripcion
                prediction.temperature = value.value
            }
            
            for temperature in temperatures {
                prediction.temperature = temperature.value
            }
            
            for humidity in humidities {
                prediction.humidity = humidity.value
            }
            
            realmodel.days.append(prediction)
            realmodel.writeToRealm()
        }
        
    }
}
