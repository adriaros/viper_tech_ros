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
    
    func updateView() {
        interactor?.fetchSomething()
    }
}

extension SelectorPresenter: SelectorInteractorToPresenterProtocol {
    
    func somethingFetched(argument: SelectorModel) {
        view?.showSomething(argument: argument)
    }
}
