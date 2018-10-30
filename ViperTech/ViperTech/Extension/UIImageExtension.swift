//
//  UIImageExtension.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/27/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init!(assetId: AssetIdentifier) {
        self.init(named: assetId.rawValue)
    }
    
    enum AssetIdentifier: String {
        case cloudy = "cloudy"
        case electric = "electric"
        case fog = "fog"
        case hail = "hail"
        case partially_cloudy = "partially_cloudy"
        case rain = "rain"
        case snow = "snow"
        case sun = "sun"
        case moon = "moon"
        case moon_cloudy = "moon_cloudy"
        
        static let values = [cloudy, electric, fog, hail, partially_cloudy, rain, snow, sun, moon, moon_cloudy]
    }
}
