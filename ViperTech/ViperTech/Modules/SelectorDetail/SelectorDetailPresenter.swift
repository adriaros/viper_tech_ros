//
//  SelectorDetailPresenter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorDetailPresenter: SelectorDetailViewToPresenterProtocol {
    
    var view: SelectorDetailPresenterToViewProtocol?
    var interactor: SelectorDetailPresenterToInteractorProtocol?
    var router: SelectorDetailPresenterToRouterProtocol?
    
    func updateView() {
    }
}

extension SelectorDetailPresenter: SelectorDetailInteractorToPresenterProtocol {
}
