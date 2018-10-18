//
//  SelectorProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorPresenterToViewProtocol: class{
    func showSomething(argument: SelectorModel)
}

protocol SelectorInteractorToPresenterProtocol: class{
    func somethingFetched(argument: SelectorModel)
}

protocol SelectorPresenterToInteractorProtocol: class{
    var presenter: SelectorInteractorToPresenterProtocol? {get set}
    func fetchSomething()
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
