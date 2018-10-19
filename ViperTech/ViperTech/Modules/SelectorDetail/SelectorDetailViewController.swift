//
//  SelectorDetailViewController.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorDetailViewController: UIViewController {
    
    var presenter: SelectorDetailViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension SelectorDetailViewController: SelectorDetailPresenterToViewProtocol {
    
}
