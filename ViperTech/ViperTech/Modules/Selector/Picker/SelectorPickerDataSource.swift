//
//  SelectorPickerDataSource.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/20/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

enum PickerTypes: String, CaseIterable {
    case timeH = "selector_picker_timeH"
    case timeL = "selector_picker_timeL"
    case priceH = "selector_picker_priceH"
    case priceL = "selector_picker_priceL"
    case genreAZ = "selector_picker_genreAZ"
    case genreZA = "selector_picker_genreZA"
    
    var localizedString: String {
        return self.rawValue.localized()
    }
}

final class SelectorPickerDataSource: NSObject, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return PickerTypes.allCases.count
    }
    
}
