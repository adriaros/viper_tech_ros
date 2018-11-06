//
//  WeatherTableDataSource.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/27/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit
import RealmSwift

final class WeatherTableDataSource: NSObject, UITableViewDataSource {
    
    let realm = try? Realm().objects(WeatherRealmModel.self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        
        guard let db = realm?[0].days else { return 0 }
        return db.count > 0 ? db.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellType, for: indexPath) as? WeatherTableViewCell else {return UITableViewCell()}
        
        guard let db = realm else { return UITableViewCell() }
        
        cell.displaySkyInfo(info: db[0].days[indexPath.row])
        cell.displayTemperature(info: db[0].temperatures[indexPath.row])
        cell.displayHumidity(info: db[0].humidities[indexPath.row])
        
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}


