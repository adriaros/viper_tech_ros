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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        delegate?.optionSelected(index: row)
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        var pickerLabel: UILabel? = (view as? UILabel)
        if pickerLabel == nil {
            pickerLabel = UILabel()
            pickerLabel?.font = UIFont(name: "System", size: 12)
            pickerLabel?.textAlignment = .left
        }
        
        pickerLabel?.text = PickerTypes.allCases[row].localizedString
        
        return pickerLabel!
    }
}
