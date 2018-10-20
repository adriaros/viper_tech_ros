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
        titleLbl.text = info.trackName
        artistLbl.text = info.artistName
        albumLbl.text = info.collectionName
        genreLbl.text = info.primaryGenreName
        priceLbl.text = "\(String(describing: info.trackPrice!))" + Constants.Cells.Selector.currency
        dateLbl.text = "\(String(describing: info.releaseDate!))"
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
