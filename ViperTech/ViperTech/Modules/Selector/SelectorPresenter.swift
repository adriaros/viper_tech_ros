//
//  SelectorPresenter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorPresenter: SelectorViewToPresenterProtocol {
    
    var view: SelectorPresenterToViewProtocol?
    var interactor: SelectorPresenterToInteractorProtocol?
    var router: SelectorPresenterToRouterProtocol?
    
    private lazy var tableDelegate: SelectorTableDelegate = {
        return SelectorTableDelegate(actionDelegate: self)
    }()
    
    private var tableDataSource: SelectorTableDataSource?
    
    private lazy var pickerDelegate: SelectorPickerDelegate = {
        return SelectorPickerDelegate(actionDelegate: self)
    }()
    
    private lazy var pickerDataSource: SelectorPickerDataSource = {
        return SelectorPickerDataSource()
    }()
    
    let vc = UIApplication.topViewController()
    
    func updateView() {
        configViews()
        configTable()
        configPicker()
        getDefaultList()
    }
    
    private func configViews(){
        view?.searchButtonView.shadow()
        view?.seachView.shadow()
        view?.filterView.shadow()
        view?.filterLbl.text = "selector_filter_lbl".localized()
        view?.filterLbl.adjustsFontSizeToFitWidth = true
    }
    
    private func configTable() {
        view?.tableView.register(UINib(nibName: SelectorTableViewCell.cellType, bundle: nil), forCellReuseIdentifier: SelectorTableViewCell.cellType)
        view?.tableView.rowHeight = ConfigParams.Sizes.Selector.cellHeight
        view?.tableView.bounces = false
        view?.tableView.tableFooterView = UIView()
        view?.tableView.delegate = tableDelegate
        tableDataSource = SelectorTableDataSource()
        view?.tableView.dataSource = tableDataSource
    }

    private func configPicker(){
        view?.pickerView.delegate = pickerDelegate
        view?.pickerView.dataSource = pickerDataSource
    }
    
    private func getDefaultList(){
        vc?.showLoader()
        interactor?.fetchList()
    }
    
    func searchButtonPressed(){
        guard let text = view?.searchTextField.text else { return }
        if text != "" {
            view?.pickerView.selectRow(0, inComponent: 0, animated: false)
            vc?.showLoader()
            interactor?.search(withInfo: text)
        }
    }
}

extension SelectorPresenter: SelectorInteractorToPresenterProtocol {
    
    func filteredList(_ list: [SelectorResultsList]) {
        SelectorSingleton.sharedInstance.filteredArray = list
        tableDataSource = SelectorTableDataSource(data: list)
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
    }
    
    func fetchedListDataSuccess(_ model: [SelectorResultsList]) {
        SelectorSingleton.sharedInstance.resultsArray = model
        SelectorSingleton.sharedInstance.filteredArray = model
        tableDataSource = SelectorTableDataSource(data: SelectorSingleton.sharedInstance.filteredArray)
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
        vc?.hideLoader()
    }
    
    func fetchedListDataFailed(_ error: Error) {
        vc?.hideLoader()
    }
}

extension SelectorPresenter: SelectorTableActionDelegate {
    func selected(index: Int) {
        guard let vc = view as? UIViewController else { return }
        router?.navigateToDetail(origin: vc, index)
    }
}

extension SelectorPresenter: SelectorPickerActionDelegate {
    
    func optionSelected(index: Int) {
        interactor?.filterList(pickerIndex: index)
    }
    
}
