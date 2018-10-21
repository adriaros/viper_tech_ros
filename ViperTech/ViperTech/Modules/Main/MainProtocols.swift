//
//  MainProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol MainPresenterToViewProtocol: class{
    var startButton: UIButton! { get set }
    var titleLbl: UILabel! { get set }
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
    func startButtonPressed()
}

protocol MainPresenterToRouterProtocol: class{
    static func createModule() -> UIViewController
    func navigateToSelector(origin: UIViewController)
}
