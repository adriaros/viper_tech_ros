//
//  SelectorTableDataSource.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

final class SelectorTableDataSource: NSObject, UITableViewDataSource {
    
    //var data: [HealthInfoItem]?
    var data = ["Hola", "Adios", "Hola", "Adios", "Hola", "Adios"]
    
    convenience init(data: [String]) {
        self.init()
        self.data = data
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
//        if let list = data.count {
//            return list
//        } else {
//            return 0
//        }
        
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SelectorTableViewCell.cellType, for: indexPath) as? SelectorTableViewCell else {return UITableViewCell()}
        return cell
    }
    
}

