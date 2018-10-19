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
    
    private var data: [SelectorResultsList] = []
    
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
        interactor?.fetchList()
    }
    
    func searchButtonPressed(){
        
    }
}

extension SelectorPresenter: SelectorInteractorToPresenterProtocol {
    
    func fetchedListDataSuccess(_ model: [SelectorResultsList]) {
        print("Model: ", model)
        data = model
        tableDataSource = SelectorTableDataSource(data: data)
        view?.tableView.dataSource = tableDataSource
        view?.tableView.reloadData()
    }
    
    func fetchedListDataFailed(_ error: Error) {
        print("Error: ", error)
    }
}

extension SelectorPresenter: SelectorTableActionDelegate {
    func selected(index: Int) {
//        guard let vc = view as? UIViewController else { return }
//        router?.navigateToDetail(origin: vc, data[index])
        print("Index: ", index)
    }
}
