//
//  RealmExtension.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/30/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import RealmSwift

extension WeatherRealmModel {
    
    func writeToRealm() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self)
        }
    }
    
}
