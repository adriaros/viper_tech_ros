//
//  WeatherProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol WeatherPresenterToViewProtocol: class{
}

protocol WeatherInteractorToPresenterProtocol: class{
}

protocol WeatherPresenterToInteractorProtocol: class{
    var presenter: WeatherInteractorToPresenterProtocol? {get set}
}

protocol WeatherViewToPresenterProtocol: class{
    var view: WeatherPresenterToViewProtocol? {get set}
    var interactor: WeatherPresenterToInteractorProtocol? {get set}
    var router: WeatherPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol WeatherPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
