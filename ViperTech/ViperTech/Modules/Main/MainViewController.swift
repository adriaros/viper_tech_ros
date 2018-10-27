//
//  MainViewController.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var presenter: MainViewToPresenterProtocol?
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var weatherButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onStartButton(_ sender: Any) {
        presenter?.startButtonPressed()
    }
    
    @IBAction func onWeatherButton(_ sender: Any) {
        presenter?.weatherButtonPressed()
    }
    
}

extension MainViewController: MainPresenterToViewProtocol {
    
}
