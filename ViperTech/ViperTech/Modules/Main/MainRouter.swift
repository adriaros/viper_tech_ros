//
//  MainRouter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class MainRouter: MainPresenterToRouterProtocol{
 
    class func createModule() -> UIViewController{
        
        let view: MainViewController = Storyboard.MainViewController.instantiateViewController()
        let presenter: MainViewToPresenterProtocol & MainInteractorToPresenterProtocol = MainPresenter()
        let interactor: MainPresenterToInteractorProtocol = MainInteractor()
        let router: MainPresenterToRouterProtocol = MainRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func navigateToSelector(origin: UIViewController){
        guard let navigationController = origin.navigationController as? NavigationBar else {return}
        navigationController.setViewControllers([SelectorRouter.createModule()], animated: false)
    }
}
