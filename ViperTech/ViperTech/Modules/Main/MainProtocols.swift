//
//  MainProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol MainPresenterToViewProtocol: class{
}

protocol MainInteractorToPresenterProtocol: class{
}

protocol MainPresenterToInteractorProtocol: class{
    var presenter: MainInteractorToPresenterProtocol? {get set}
}

protocol MainViewToPresenterProtocol: class{
    var view: MainPresenterToViewProtocol? {get set}
    var interactor: MainPresenterToInteractorProtocol? {get set}
    var router: MainPresenterToRouterProtocol? {get set}
    func updateView()
}

protocol MainPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
}
