//
//  WeatherRouter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class WeatherRouter: WeatherPresenterToRouterProtocol{
    
    class func createModule() -> UIViewController{
        let view = WeatherViewController()
        let presenter: WeatherViewToPresenterProtocol & WeatherInteractorToPresenterProtocol = WeatherPresenter()
        let interactor: WeatherPresenterToInteractorProtocol = WeatherInteractor()
        let router: WeatherPresenterToRouterProtocol = WeatherRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
}
