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
    @IBOutlet weak var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        cellView.cellShadow()
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
        genreLbl.text = info.kind
        priceLbl.text = "\(String(describing: info.trackPrice))"
        durationLbl.text = "\(String(describing: info.trackTimeMillis))"
        getImage(image: info.artworkUrl100)
    }
    
    private func getImage(image: String?){
        guard let img = image else { return }
        let url = URL(string: img)
        let data = try? Data(contentsOf: url!)
        albumImageView.image = UIImage(data: data!)
    }
}
