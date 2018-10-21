//
//  SelectorSingleton.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/21/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation

class SelectorSingleton : NSObject {
    
    static let sharedInstance = SelectorSingleton()
    
    var resultsArray: [SelectorResultsList] = []
    var filteredArray: [SelectorResultsList] = []
    
    private override init() { }
    
}
