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
    let days = List<DaysRealm>()
    let temperatures = List<TemperaturesRealm>()
    let humidities = List<HumiditiesRealm>()
}

class DaysRealm: Object {
    @objc dynamic var hour: String? = nil
    @objc dynamic var sky: String? = nil
}

class TemperaturesRealm: Object {
    @objc dynamic var temperature: String? = nil
}

class HumiditiesRealm: Object {
    @objc dynamic var humidity: String? = nil
}

extension WeatherRealmModel {
    func writeToRealm() {
        try! realm?.write {
            realm?.add(self)
        }
    }
}
