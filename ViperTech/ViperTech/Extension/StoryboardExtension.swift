//
//  StoryboardExtension.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

enum Storyboard : String {
    case EnvironmentSelector
    case MainViewController
    case SelectorViewController
    
    func instantiateViewController<T>() -> T where T: StoryboardIdentifiable {
        let sb = UIStoryboard(storyboard: self)
        let optionalViewController = sb.instantiateViewController(withIdentifier: T.storyboardIdentifier)
        
        guard let viewController = optionalViewController as? T  else {
            fatalError(Constants.Errors.Interns.vc_instance + (T.storyboardIdentifier) )
        }
        
        return viewController
    }
}

extension UIStoryboard {
    
    convenience init(storyboard: Storyboard, bundle: Bundle? = nil) {
        self.init(name: storyboard.rawValue, bundle: bundle)
    }
}

extension UIViewController : StoryboardIdentifiable {}

protocol StoryboardIdentifiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardIdentifiable where Self: UIViewController {
    
    static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
}
