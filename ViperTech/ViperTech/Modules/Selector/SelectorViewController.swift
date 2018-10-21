//
//  SelectorViewController.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorViewController: UIViewController {
    
    var presenter: SelectorViewToPresenterProtocol?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButtonView: UIView!
    @IBOutlet weak var filterLbl: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var seachView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        hideKeyboardWhenTappedAround()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onSearchButton(_ sender: Any) {
        presenter?.searchButtonPressed()
    }
    
}

extension SelectorViewController: SelectorPresenterToViewProtocol {
}
