//
//  SelectorDetailProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorDetailPresenterToViewProtocol: class{
}

protocol SelectorDetailInteractorToPresenterProtocol: class{
}

protocol SelectorDetailPresenterToInteractorProtocol: class{
    var presenter: SelectorDetailInteractorToPresenterProtocol? {get set}
}

protocol SelectorDetailViewToPresenterProtocol: class{
    var view: SelectorDetailPresenterToViewProtocol? {get set}
    var interactor: SelectorDetailPresenterToInteractorProtocol? {get set}
    var router: SelectorDetailPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol SelectorDetailPresenterToRouterProtocol: class{
    static func createModule(data: [SelectorResultsList]) -> UIViewController
}
