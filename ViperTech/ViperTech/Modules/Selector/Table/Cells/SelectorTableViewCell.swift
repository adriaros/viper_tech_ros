//
//  SelectorTableViewCell.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

class SelectorTableViewCell: UITableViewCell {
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var artistLbl: UILabel!
    @IBOutlet weak var albumLbl: UILabel!
    @IBOutlet weak var genreLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var durationLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.shadow()
        cellView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        self.selectionStyle = .none
    }
    
    static var cellType: String {
        return String(describing: self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayCell(info: SelectorResultsList){
        guard let song = info.trackName else {
            titleLbl.text = "-"
            return
        }
        titleLbl.text = song

        guard let artist = info.artistName else {
            artistLbl.text = "-"
            return
        }
        artistLbl.text = artist
        
        guard let collection = info.collectionName else {
            albumLbl.text = "-"
            return
        }
        albumLbl.text = collection
        
        guard let genre = info.primaryGenreName else {
            genreLbl.text = "-"
            return
        }
        genreLbl.text = genre
        
        guard let price = info.trackPrice else {
           priceLbl.text = "0" + Constants.Cells.Selector.currency
            return
        }
        priceLbl.text = "\(String(describing: price))" + Constants.Cells.Selector.currency
        
        guard let date = info.releaseDate else {
            dateLbl.text = "-"
            return
        }
        dateLbl.text = "\(String(describing: date))"
        
        displayImage(image: info.artworkUrl100)
        displayDuration(ms: info.trackTimeMillis)
    }
    
    private func displayImage(image: String?){
        guard let img = image else { return }
        let url = URL(string: img)
        let data = try? Data(contentsOf: url!)
        albumImageView.image = UIImage(data: data!)
    }
    
    private func displayDuration(ms: Int?){
        guard let ms = ms else { return }
        durationLbl.text = ms.msToSec.minuteSecondFormat
    }
}
