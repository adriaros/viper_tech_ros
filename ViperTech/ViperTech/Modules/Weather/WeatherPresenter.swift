//
//  WeatherPresenter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherPresenter: WeatherViewToPresenterProtocol {
    
    var view: WeatherPresenterToViewProtocol?
    var interactor: WeatherPresenterToInteractorProtocol?
    var router: WeatherPresenterToRouterProtocol?
    
    private lazy var tableDelegate: WeatherTableDelegate = {
        return WeatherTableDelegate()
    }()
    
    private var tableDataSource: WeatherTableDataSource?
    
    func updateView() {
        configTable()
        interactor?.fetchWeather()
    }
    
    private func configTable(){
        view?.tableView.register(UINib(nibName: WeatherTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.cellType)
        view?.tableView.rowHeight = ConfigParams.Sizes.Weather.cellHeight
        view?.tableView.bounces = false
        view?.tableView.tableFooterView = UIView()
        view?.tableView.backgroundColor = UIColor.clear
        view?.tableView.delegate = tableDelegate
        tableDataSource = WeatherTableDataSource()
        view?.tableView.dataSource = tableDataSource
    }
}

extension WeatherPresenter: WeatherInteractorToPresenterProtocol {
    
    func fetchedWeatherSuccess() {
        view?.tableView.reloadData()
    }
    
    func fetchedWeatherFailed(error: String) {
        
    }
}
