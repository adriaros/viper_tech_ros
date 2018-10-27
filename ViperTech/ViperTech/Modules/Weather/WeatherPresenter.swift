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
    
    func fetchedWeatherSuccess(data: [WeatherDetailResponse]) {
        guard let prediction = data[0].prediccion?.dia else { return }
        tableDataSource = WeatherTableDataSource(data: prediction)
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
    }
    
    func fetchedWeatherFailed(error: String) {
        
    }
}
