//
//  SelectorProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorPresenterToViewProtocol: class{
    var tableView: UITableView!  { get set }
    var searchTextField: UITextField! { get set }
    var searchButtonView: UIView! { get set }
    var filterLbl: UILabel! { get set }
    var pickerView: UIPickerView! { get set }
    var filterView: UIView! { get set }
    var seachView: UIView!  { get set }
}

protocol SelectorInteractorToPresenterProtocol: class{
    func fetchedListDataSuccess(_ model: [SelectorResultsList])
    func fetchedListDataFailed(_ error: Error)
    func filteredList(_ list: [SelectorResultsList])
}

protocol SelectorPresenterToInteractorProtocol: class{
    var presenter: SelectorInteractorToPresenterProtocol? {get set}
    func fetchList()
    func search(withInfo: String)
    func filterList(pickerIndex: Int)
}

protocol SelectorViewToPresenterProtocol: class{
    var view: SelectorPresenterToViewProtocol? {get set}
    var interactor: SelectorPresenterToInteractorProtocol? {get set}
    var router: SelectorPresenterToRouterProtocol? {get set}
    func updateView()
    func searchButtonPressed()
}

protocol SelectorPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    func navigateToDetail(origin: UIViewController, _ index: Int)
}
