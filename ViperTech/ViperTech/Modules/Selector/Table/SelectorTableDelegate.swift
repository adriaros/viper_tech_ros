//
//  SelectorTableDelegate.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorTableActionDelegate: class {
    func selected(index: Int)
}

final class SelectorTableDelegate: NSObject, UITableViewDelegate {
    
    weak var delegate: SelectorTableActionDelegate?
    
    init(actionDelegate: SelectorTableActionDelegate) {
        super.init()
        self.delegate = actionDelegate
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.selected(index: indexPath.row)
    }
    
}


