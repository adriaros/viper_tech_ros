//
//  SelectorProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorPresenterToViewProtocol: class{
    var searchBar: UISearchBar! { get set }
    var tableView: UITableView!  { get set }
}

protocol SelectorInteractorToPresenterProtocol: class{
}

protocol SelectorPresenterToInteractorProtocol: class{
    var presenter: SelectorInteractorToPresenterProtocol? {get set}
}

protocol SelectorViewToPresenterProtocol: class{
    var view: SelectorPresenterToViewProtocol? {get set}
    var interactor: SelectorPresenterToInteractorProtocol? {get set}
    var router: SelectorPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol SelectorPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
