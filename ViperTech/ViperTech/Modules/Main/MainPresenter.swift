//
//  MainPresenter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class MainPresenter: MainViewToPresenterProtocol {
    
    var view: MainPresenterToViewProtocol?
    var interactor: MainPresenterToInteractorProtocol?
    var router: MainPresenterToRouterProtocol?
    
    func updateView() {
        view?.startButton.roundCorners()
        view?.startButton.setTitle("mainbutton_title".localized(), for: .normal)
        view?.titleLbl.text = "main_title_lbl".localized()
    }
    
    func startButtonPressed() {
        guard let vc = view as? UIViewController else { return }
        router?.navigateToSelector(origin: vc)
    }
}

extension MainPresenter: MainInteractorToPresenterProtocol {
    
}
