//
//  SelectorRouter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorRouter: SelectorPresenterToRouterProtocol{
    
    class func createModule() -> UIViewController{
        
        let view = SelectorViewController()
        let presenter: SelectorViewToPresenterProtocol & SelectorInteractorToPresenterProtocol = SelectorPresenter()
        let interactor: SelectorPresenterToInteractorProtocol = SelectorInteractor()
        let router: SelectorPresenterToRouterProtocol = SelectorRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
