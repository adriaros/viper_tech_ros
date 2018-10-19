//
//  TimeTervalExtension.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/19/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import Foundation

extension TimeInterval {
    var minuteSecondFormat: String {
        return String(format:"%d:%02ds", minute, second)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
}

extension Int {
    var msToSec: Double {
        return Double(self) / 1000
    }
}
