//
//  SelectorInteractor.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class SelectorInteractor: SelectorPresenterToInteractorProtocol{
    
    var presenter: SelectorInteractorToPresenterProtocol?
    
    func fetchList() {
        
        APIClient.getDefaultList() { (DTO, error) in
            
            if error != nil {
                guard let error = error else { return }
                self.presenter?.fetchedListDataFailed(error)
            } else {
                guard let results = DTO?.results else { return }
                self.presenter?.fetchedListDataSuccess(results)
            }
            
        }
    }
    
    func search(withInfo: String) {
        let item = translateSearch(item: withInfo)
        Constants.Networking.Url.item_search = item
        getSpecificList()
    }
    
    private func translateSearch(item: String) -> String {
        if item.contains(" "){
            return item.replacingOccurrences(of: " ", with: "+")
        } else {
            return item
        }
    }
    
    private func getSpecificList(){
        APIClient.getSearchList() { (DTO, error) in
            
            if error != nil {
                guard let error = error else { return }
                self.presenter?.fetchedListDataFailed(error)
            } else {
                guard let results = DTO?.results else { return }
                self.presenter?.fetchedListDataSuccess(results)
            }
            
        }
    }
    
    func filterList(pickerIndex: Int) {
        
        let resultsArray = SelectorSingleton.sharedInstance.resultsArray
        var filteredArray = SelectorSingleton.sharedInstance.resultsArray
        
        switch pickerIndex {
        case 1:
            filteredArray = resultsArray.sorted(by: { $0.trackTimeMillis! > $1.trackTimeMillis! })
            break
        case 2:
            filteredArray = resultsArray.sorted(by: { $0.trackTimeMillis! < $1.trackTimeMillis! })
            break
        case 3:
            filteredArray = resultsArray.sorted(by: { $0.trackPrice! > $1.trackPrice! })
            break
        case 4:
            filteredArray = resultsArray.sorted(by: { $0.trackPrice! < $1.trackPrice! })
            break
        case 5:
            filteredArray = resultsArray.sorted(by: { $0.primaryGenreName! < $1.primaryGenreName! })
            break
        case 6:
            filteredArray = resultsArray.sorted(by: { $0.primaryGenreName! > $1.primaryGenreName! })
            break
        default:
            filteredArray = resultsArray
            break
        }
        
        presenter?.filteredList(filteredArray)
    }
}
