//
//  WeatherViewController.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    var presenter: WeatherViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension WeatherViewController: WeatherPresenterToViewProtocol {
    
}
