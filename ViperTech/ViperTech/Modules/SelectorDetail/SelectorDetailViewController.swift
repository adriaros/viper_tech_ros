//
//  SelectorDetailViewController.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorDetailViewController: UIViewController {
    
    var presenter: SelectorDetailViewToPresenterProtocol?
    
    @IBOutlet weak var albumImage: UIImageView!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var playPauseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.updateView()
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        presenter?.stopAll()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onPlayPauseButton(_ sender: Any) {
        presenter?.playPausePressed()
    }
    
    @IBAction func onNextButton(_ sender: Any) {
        presenter?.nextSongPressed()
    }
    
    @IBAction func onPoreviousButton(_ sender: Any) {
        presenter?.previousSongPressed()
    }
    
}

extension SelectorDetailViewController: SelectorDetailPresenterToViewProtocol {
    
}
