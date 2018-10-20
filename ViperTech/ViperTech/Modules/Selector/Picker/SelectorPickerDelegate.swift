//
//  SelectorPickerDelegate.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/20/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

protocol SelectorPickerActionDelegate: class {
    func optionSelected(index: Int)
}

final class SelectorPickerDelegate: NSObject, UIPickerViewDelegate {
    
    weak var delegate: SelectorPickerActionDelegate?
    
    init(actionDelegate: SelectorPickerActionDelegate) {
        super.init()
        self.delegate = actionDelegate
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return PickerTypes.allCases[row].localizedString
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        delegate?.optionSelected(index: row)
    }
}
