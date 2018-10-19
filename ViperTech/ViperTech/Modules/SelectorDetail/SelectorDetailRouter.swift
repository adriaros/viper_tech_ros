//
//  SelectorDetailRouter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorDetailRouter: SelectorDetailPresenterToRouterProtocol{
    
    class func createModule(index: Int) -> UIViewController{
        let view = SelectorDetailViewController()
        let presenter: SelectorDetailViewToPresenterProtocol & SelectorDetailInteractorToPresenterProtocol = SelectorDetailPresenter()
        let interactor: SelectorDetailPresenterToInteractorProtocol = SelectorDetailInteractor()
        let router: SelectorDetailPresenterToRouterProtocol = SelectorDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.index = index
        
        return view
    }
}
