//
//  AlertUtils.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/21/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

func showAlert(title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.actionSheet)
    alert.addAction(UIAlertAction(title: "alert_ok_button".localized(), style: UIAlertAction.Style.default, handler: nil))
    let vc = UIApplication.topViewController()
    vc?.present(alert, animated: true, completion: nil)
}
