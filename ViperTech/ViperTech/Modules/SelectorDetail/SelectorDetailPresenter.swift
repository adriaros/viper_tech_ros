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
    
    var data = SelectorSingleton.sharedInstance.resultsArray
    var index = Int()
    var currentIndex = 0
    var isPlay = false
    
    func updateView() {
        displayAlbumImage(image: data[index].artworkUrl100)
        displayInformation()
        currentIndex = index
    }
    
    private func displayInformation(){
        view?.artistNameLbl.text = data[currentIndex].artistName
        view?.songNameLbl.text = data[currentIndex].trackName
    }
    
    private func displayAlbumImage(image: String?){
        guard let img = image else { return }
        let url = URL(string: img)
        let data = try? Data(contentsOf: url!)
       view?.albumImage.image = UIImage(data: data!)
    }
    
    func playPausePressed() {
        isPlay = !isPlay
    }
    
    func nextSongPressed() {
        interactor?.nextSong(index: currentIndex)
    }
    
    func previousSongPressed() {
        interactor?.previousSong(index: currentIndex)
    }
}

extension SelectorDetailPresenter: SelectorDetailInteractorToPresenterProtocol {
    
    func nextSong(index: Int) {
        currentIndex = index
        displayInformation()
        displayAlbumImage(image: data[currentIndex].artworkUrl100)
    }
    
    func previousSong(index: Int) {
        currentIndex = index
        displayInformation()
        displayAlbumImage(image: data[currentIndex].artworkUrl100)
    }

}
