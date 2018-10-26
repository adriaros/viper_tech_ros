//
//  WeatherPresenter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class WeatherPresenter: WeatherViewToPresenterProtocol {
    
    var view: WeatherPresenterToViewProtocol?
    var interactor: WeatherPresenterToInteractorProtocol?
    var router: WeatherPresenterToRouterProtocol?
    
    func updateView() {
    }
}

extension WeatherPresenter: WeatherInteractorToPresenterProtocol {

}
