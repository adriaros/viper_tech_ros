//
//  WeatherTableViewCell.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/27/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var backImage: UIImageView!
    
    @IBOutlet weak var hourTitleLbl: UILabel!
    @IBOutlet weak var hourLbl: UILabel!
    
    @IBOutlet weak var tempTitleLbl: UILabel!
    @IBOutlet weak var tempLbl: UILabel!
    
    @IBOutlet weak var humTitleLbl: UILabel!
    @IBOutlet weak var humLbl: UILabel!
    
    @IBOutlet weak var skyTtileLbl: UILabel!
    @IBOutlet weak var skyLbl: UILabel!
    @IBOutlet weak var skyImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        cellView.shadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static var cellType: String {
        return String(describing: self)
    }
    
    func displayBackground(info: EstadoCielo){
        guard let hour = info.periodo else { return }
        guard let hour_int = Int(hour) else { return }
        
        if hour_int >= 19 { imageView?.image = UIImage(named: "night_background.jpg") }
        else { imageView?.image = UIImage(named: "day_background.jpg") }
    }
    
    func displaySkyInfo(info: DaysRealm){
        guard let hour = info.hour else { hourLbl.text = "-"; return }
        hourLbl.text = hour
        guard let sky = info.sky else { skyLbl.text = "-"; return }
        skyLbl.text = sky
        guard let h = Int(hour) else { return }
        skyImage.image = setSkyImage(desc: sky, h: h)
    }
    
    func displayTemperature(info: TemperaturesRealm){
        guard let temp = info.temperature else { tempLbl.text = "-"; return }
        tempLbl.text = temp + "ºC"
    }
    
    func displayHumidity(info: HumiditiesRealm){
        guard let hum = info.humidity else { tempLbl.text = "-"; return }
        humLbl.text = hum + "%"
    }
    
    private func setSkyImage(desc: String, h: Int) -> UIImage {
        if desc == SkyImage.despejado.rawValue {
            return h >= 20 || h <= 7 ? SkyImage.noche.image : SkyImage.despejado.image
        } else if desc == SkyImage.poco_nuboso.rawValue {
            return h >= 20 || h <= 7 ? SkyImage.noche_nubosa.image : SkyImage.poco_nuboso.image
        } else if desc == SkyImage.intervalos_nubosos.rawValue {
            return SkyImage.intervalos_nubosos.image
        } else if desc == SkyImage.nuboso.rawValue {
            return SkyImage.nuboso.image
        } else if desc == SkyImage.muy_nuboso.rawValue {
            return SkyImage.muy_nuboso.image
        } else if desc == SkyImage.cubierto.rawValue {
            return SkyImage.cubierto.image
        } else if desc == SkyImage.nubes_altas.rawValue {
            return SkyImage.nubes_altas.image
        } else if desc == SkyImage.intervalos_nubosos_con_lluvia.rawValue {
            return SkyImage.intervalos_nubosos_con_lluvia.image
        } else if desc == SkyImage.nuboso_con_lluvia.rawValue {
            return SkyImage.nuboso_con_lluvia.image
        } else if desc == SkyImage.muy_nuboso_con_lluvia.rawValue {
            return SkyImage.muy_nuboso_con_lluvia.image
        } else if desc == SkyImage.cubierto_con_lluvia.rawValue {
            return SkyImage.cubierto_con_lluvia.image
        } else if desc == SkyImage.cubierto_con_lluvia_escasa.rawValue {
            return SkyImage.cubierto_con_lluvia_escasa.image
        } else if desc == SkyImage.intervalos_nubosos_con_nieve.rawValue {
            return SkyImage.intervalos_nubosos_con_nieve.image
        } else if desc == SkyImage.nuboso_con_nieve.rawValue {
            return SkyImage.nuboso_con_nieve.image
        } else if desc == SkyImage.muy_nuboso_con_nieve.rawValue {
            return SkyImage.muy_nuboso_con_nieve.image
        } else if desc == SkyImage.chubascos.rawValue {
            return SkyImage.chubascos.image
        } else if desc == SkyImage.tormenta.rawValue {
            return SkyImage.tormenta.image
        } else if desc == SkyImage.granizo.rawValue {
            return SkyImage.granizo.image
        } else if desc == SkyImage.bruma.rawValue || desc == SkyImage.niebla.rawValue || desc == SkyImage.calima.rawValue {
            return SkyImage.bruma.image
        } else {
            return UIImage()
        }
    }
    
}
