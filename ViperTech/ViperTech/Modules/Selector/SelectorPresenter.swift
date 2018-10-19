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
    
    let vc = UIApplication.topViewController()
    
    func updateView() {
        configTable()
        getDefaultList()
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
    
    private func getDefaultList(){
        vc?.showLoader()
        interactor?.fetchList()
    }
    
    func searchButtonPressed(){
        vc?.showLoader()
        guard let text = view?.searchTextField.text else { return }
        if text != "" { interactor?.search(withInfo: text) }
    }
}

extension SelectorPresenter: SelectorInteractorToPresenterProtocol {
    
    func fetchedListDataSuccess(_ model: [SelectorResultsList]) {
        SelectorSingleton.sharedInstance.resultsArray = model
        tableDataSource = SelectorTableDataSource(data: SelectorSingleton.sharedInstance.resultsArray)
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
        vc?.hideLoader()
    }
    
    func fetchedListDataFailed(_ error: Error) {
        print("Error: ", error)
        vc?.hideLoader()
    }
}

extension SelectorPresenter: SelectorTableActionDelegate {
    func selected(index: Int) {
//        guard let vc = view as? UIViewController else { return }
//        router?.navigateToDetail(origin: vc, data[index])
        print("Index: ", index)
    }
}
