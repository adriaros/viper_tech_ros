//
//  WeatherEntities.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/26/18.
//  Copyright (c) 2018 adriaros. All rights reserved.
//

import UIKit
import RealmSwift

class WeatherRealmModel: Object {
    let days = List<PredictionRealm>()
}

class PredictionRealm: Object {
    @objc dynamic var hour: String? = nil
    @objc dynamic var sky: String? = nil
    @objc dynamic var temperature: String? = nil
    @objc dynamic var humidity: String? = nil
}

extension WeatherRealmModel {
    func writeToRealm() {
        try! realm?.write {
            realm?.add(self)
        }
    }
}
