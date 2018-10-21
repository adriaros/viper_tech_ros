//
//  SelectorDetailInteractor.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorDetailInteractor: SelectorDetailPresenterToInteractorProtocol{
    
    var presenter: SelectorDetailInteractorToPresenterProtocol?
 
    let data = SelectorSingleton.sharedInstance.resultsArray
    let count = SelectorSingleton.sharedInstance.resultsArray.count

    func nextSong(index: Int) {
        presenter?.nextSong(index: getNextIndex(index: index))
    }
    
    func previousSong(index: Int) {
        presenter?.previousSong(index: getPreviousIndex(index: index))
    }

    private func getNextIndex(index: Int) -> Int {
        if index >= count-1 { return 0 } else { return index+1 }
    }

    private func getPreviousIndex(index: Int) -> Int {
        if index <= 0 { return count-1 } else { return index-1 }
    }

}
