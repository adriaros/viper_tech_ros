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
    
    let vc = UIApplication.topViewController()
    
    func updateView() {
        vc?.showLoader()
        configTable()
        interactor?.fetchWeather()
    }
    
    private func configTable(){
        view?.tableView.register(UINib(nibName: WeatherTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: WeatherTableViewCell.cellType)
        view?.tableView.rowHeight = ConfigParams.Sizes.Weather.cellHeight
        view?.tableView.bounces = false
        view?.tableView.tableFooterView = UIView()
        view?.tableView.backgroundColor = UIColor.clear
    }
}

extension WeatherPresenter: WeatherInteractorToPresenterProtocol {
    
    func fetchedWeatherSuccess() {
        view?.tableView.delegate = tableDelegate
        tableDataSource = WeatherTableDataSource()
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
        vc?.hideLoader()
    }
    
    func fetchedWeatherFailed(error: Error) {
        showAlert(title: "selector_data_loading_fail_title".localized(), message: error.localizedDescription)
        vc?.hideLoader()
    }
}
