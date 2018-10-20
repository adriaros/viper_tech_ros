//
//  SelectorDetailProtocols.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorDetailPresenterToViewProtocol: class{
    var albumImage: UIImageView! { get set }
    var artistNameLbl: UILabel! { get set }
    var songNameLbl: UILabel! { get set }
    var playPauseButton: UIButton! { get set }
    var albumImageContainer: UIView! { get set }
}

protocol SelectorDetailInteractorToPresenterProtocol: class{
    func nextSong(index: Int)
    func previousSong(index: Int)
}

protocol SelectorDetailPresenterToInteractorProtocol: class{
    var presenter: SelectorDetailInteractorToPresenterProtocol? {get set}
    func nextSong(index: Int)
    func previousSong(index: Int)
}

protocol SelectorDetailViewToPresenterProtocol: class{
    var view: SelectorDetailPresenterToViewProtocol? {get set}
    var interactor: SelectorDetailPresenterToInteractorProtocol? {get set}
    var router: SelectorDetailPresenterToRouterProtocol? {get set}
    func updateView()
    var index: Int { get set }
    func playPausePressed()
    func nextSongPressed()
    func previousSongPressed()
    func stopAll()
}

protocol SelectorDetailPresenterToRouterProtocol: class{
    static func createModule(index: Int) -> UIViewController
}
