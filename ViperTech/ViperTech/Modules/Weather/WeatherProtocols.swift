//
//  WeatherProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol WeatherPresenterToViewProtocol: class{
    var tableView: UITableView! { get set }
}

protocol WeatherInteractorToPresenterProtocol: class{
    func fetchedWeatherSuccess(data: [WeatherDetailResponse])
    func fetchedWeatherFailed(error: String)
}

protocol WeatherPresenterToInteractorProtocol: class{
    var presenter: WeatherInteractorToPresenterProtocol? {get set}
    func fetchWeather()
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
