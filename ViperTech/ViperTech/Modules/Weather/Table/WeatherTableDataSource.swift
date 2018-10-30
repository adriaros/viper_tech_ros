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
    
    let realm = try! Realm().objects(WeatherRealmModel.self)
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return realm[0].days.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellType, for: indexPath) as? WeatherTableViewCell else {return UITableViewCell()}
        
        cell.displaySkyInfo(info: realm[0].days[indexPath.row])
        cell.displayTemperature(info: realm[0].temperatures[indexPath.row])
        cell.displayHumidity(info: realm[0].humidities[indexPath.row])
        
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}


