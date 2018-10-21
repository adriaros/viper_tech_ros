//
//  SelectorInteractor.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
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
    
    private func dataTreatment(data: [SelectorResultsList]) -> [SelectorResultsList]{
        var array: [SelectorResultsList] = []
        for index in 0...data.count-1 {
            if checkData(data: data[index]) {
                array.append(data[index])
            }
        }
        return array
    }
    
    private func checkData(data: SelectorResultsList) -> Bool{
        if data.wrapperType != Constants.Networking.Service.Selector.type { return false }
        else { return true }
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
                self.presenter?.fetchedListDataSuccess(self.dataTreatment(data: results))
            }
        }
    }
    
    func filterList(pickerIndex: Int) {
        
        let resultsArray = SelectorSingleton.sharedInstance.resultsArray
        var filteredArray = SelectorSingleton.sharedInstance.resultsArray
        
        switch pickerIndex {
        case 1:
            if filterByTimeAvailable(resultsArray){
            filteredArray = resultsArray.sorted(by: { $0.trackTimeMillis! > $1.trackTimeMillis! })
            }
            break
        case 2:
            if filterByTimeAvailable(resultsArray){
            filteredArray = resultsArray.sorted(by: { $0.trackTimeMillis! < $1.trackTimeMillis! })
            }
            break
        case 3:
            if filterByPriceAvailable(resultsArray){
            filteredArray = resultsArray.sorted(by: { $0.trackPrice! > $1.trackPrice! })
            }
            break
        case 4:
            if filterByPriceAvailable(resultsArray){
            filteredArray = resultsArray.sorted(by: { $0.trackPrice! < $1.trackPrice! })
            }
            break
        case 5:
            if filterByGenreAvailable(resultsArray){
            filteredArray = resultsArray.sorted(by: { $0.primaryGenreName! < $1.primaryGenreName! })
            }
            break
        case 6:
            if filterByGenreAvailable(resultsArray){
            filteredArray = resultsArray.sorted(by: { $0.primaryGenreName! > $1.primaryGenreName! })
            }
            break
        default:
            break
        }
        
        presenter?.filteredList(filteredArray)
    }
    
    private func filterByTimeAvailable(_ data: [SelectorResultsList]) -> Bool {
        for i in 0...data.count-1 {
            if data[i].trackTimeMillis == nil {
                showAlert(title: "filter_no_possible".localized(), message: "no_filter_time".localized())
                return false
            }
        }
        return true
    }
    
    private func filterByPriceAvailable(_ data: [SelectorResultsList]) -> Bool {
        for i in 0...data.count-1 {
            if data[i].trackPrice == nil {
                showAlert(title: "filter_no_possible".localized(), message: "no_filter_price".localized())
                return false
            }
        }
        return true
    }
    
    private func filterByGenreAvailable(_ data: [SelectorResultsList]) -> Bool {
        for i in 0...data.count-1 {
            if data[i].primaryGenreName == nil {
                showAlert(title: "filter_no_possible".localized(), message: "no_filter_genre".localized())
                return false
            }
        }
        return true
    }
}
