//
//  SelectorDetailPresenter.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit
import AVFoundation

class SelectorDetailPresenter: SelectorDetailViewToPresenterProtocol {

    var view: SelectorDetailPresenterToViewProtocol?
    var interactor: SelectorDetailPresenterToInteractorProtocol?
    var router: SelectorDetailPresenterToRouterProtocol?
    
    var data = SelectorSingleton.sharedInstance.filteredArray
    var index = Int()
    var currentIndex = 0
    
    var player:AVPlayer?
    var playerItem:AVPlayerItem?
    
    func updateView() {
        view?.albumImageContainer.shadow()
        displayAlbumImage(image: data[index].artworkUrl100)
        currentIndex = index
        displayInformation()
        prepareSession()
        prepareSong()
        
        NotificationCenter.default.addObserver(self, selector: #selector(songFinished), name: .AVPlayerItemDidPlayToEndTime, object: nil)
    }
    
    @objc func songFinished(notification : NSNotification) {
        interactor?.nextSong(index: currentIndex)
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
        prepareSong()
    }
    
    func nextSongPressed() {
        player?.pause()
        interactor?.nextSong(index: currentIndex)
    }
    
    func previousSongPressed() {
        player?.pause()
        interactor?.previousSong(index: currentIndex)
    }
    
    private func prepareSession(){
        guard let song = data[currentIndex].previewUrl else { return }
        let url = URL(string: song)
        let playerItem:AVPlayerItem = AVPlayerItem(url: url!)
        player = AVPlayer(playerItem: playerItem)
    }
    
    private func prepareSong(){
        if player?.rate == 0 {
            player!.play()
            view?.playPauseButton.setImage(UIImage(named: "Pause.png"), for: .normal)
        } else {
            player!.pause()
            view?.playPauseButton.setImage(UIImage(named: "Play.png"), for: .normal)
        }
    }
    
    func stopAll() {
        player?.pause()
    }
    
}

extension SelectorDetailPresenter: SelectorDetailInteractorToPresenterProtocol {
    
    func nextSong(index: Int) {
        currentIndex = index
        displayInformation()
        displayAlbumImage(image: data[currentIndex].artworkUrl100)
        prepareSession()
        prepareSong()
    }
    
    func previousSong(index: Int) {
        currentIndex = index
        displayInformation()
        displayAlbumImage(image: data[currentIndex].artworkUrl100)
        prepareSession()
        prepareSong()
    }

}
