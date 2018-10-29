//
//  WeatherTableDataSource.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/27/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

final class WeatherTableDataSource: NSObject, UITableViewDataSource {
    
    var data: [Dia]?
    
    convenience init(data: [Dia]) {
        self.init()
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let hours = data?[0].estadoCielo?.count else { return 0 }
        return hours
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.cellType, for: indexPath) as? WeatherTableViewCell else {return UITableViewCell()}
        
        guard let skyInfo = data?[0].estadoCielo else { return UITableViewCell() }
        //cell.displayBackground(info: skyInfo[indexPath.row])
        cell.displaySkyInfo(info: skyInfo[indexPath.row])
        
        guard let temperature = data?[0].temperatura else { return UITableViewCell() }
        cell.displayTemperature(info: temperature[indexPath.row])
        
        guard let humidity = data?[0].humedadRelativa else { return UITableViewCell() }
        cell.displayHumidity(info: humidity[indexPath.row])
        
        cell.contentView.backgroundColor = UIColor.clear
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
}


