//
//  NavigationBarExtension.swift
//  ViperTech
//
//  Created by Adria Ros Saez on 10/18/18.
//  Copyright © 2018 adriaros. All rights reserved.
//

import UIKit

//MARK: - Enums
enum NavigationBarType {
    case plain, home
}

enum NavigationBarLeft {
    case none
}

enum NavigationBarMiddle {
    case title(text: String)
}

enum NavigationBarRight {
    case none
}

//MARK: - NavigationBar Class
class NavigationBar: UINavigationController {
    //MARK: - Properties
    var configurationType: NavigationBarType = .plain
    fileprivate var target: UIViewController!
    
    override var viewControllers: [UIViewController] {
        didSet{
            guard let vc = viewControllers.last else { return }
            configureTarget(vc)
        }
    }
    
    override func setViewControllers(_ viewControllers: [UIViewController], animated: Bool) {
        super.setViewControllers(viewControllers, animated: animated)
        configureTarget(viewControllers[0])
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        configureTarget(viewController)
    }

    //MARK: - Configuration functions
    private func configureTarget(_ target: UIViewController) {
        self.target = target
        self.navigationBar.tintColor = UIColor.blue
        switch target {
        case is MainViewController:
            configure()
        case is SelectorViewController:
            configure(middle: .title(text: "navBar_selector_title".localized()))
        default:
            break
        }
    }
    
    func configure(left: NavigationBarLeft? = nil, middle: NavigationBarMiddle? = nil, right: NavigationBarRight? = nil, backgroundColor: UIColor? = nil) {
        
        if let left = left {
            target.navigationItem.leftBarButtonItem = setupLeftBarButton(type: left)
        }
        
        if let middle = middle {
            setupMiddleBarButton(type: middle)
        }
        
        if let right = right {
            target.navigationItem.rightBarButtonItem = setupRightBarButton(type: right)
        }
        
        if let backgroundColor = backgroundColor {
            target.navigationController?.navigationBar.barTintColor = backgroundColor
            if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                statusbar.backgroundColor = UIColor.clear
            }
        } else {
            target.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
            target.navigationController?.navigationBar.shadowImage = UIImage()
            target.navigationController?.navigationBar.isTranslucent = true
            target.navigationController?.view.backgroundColor = .clear
            target.navigationController?.navigationBar.backgroundColor = .clear
            target.navigationController?.navigationBar.barTintColor = nil
            //target.navigationController?.navigationBar.isHidden = true
            if let statusbar = UIApplication.shared.value(forKey: "statusBar") as? UIView {
                statusbar.backgroundColor = UIColor.clear
            }
        }
    }
}

extension NavigationBar {
    fileprivate func setupLeftBarButton(type: NavigationBarLeft?) -> UIBarButtonItem? {
        guard let type = type else { return nil }
        switch type {
        case .none:
            return nil
        }
    }
    
    fileprivate func setupMiddleBarButton(type: NavigationBarMiddle?) {
        guard let type = type else { return }
        switch type {
        case .title(let text):
            target.navigationItem.title = text
            let textAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
            target.navigationController?.navigationBar.titleTextAttributes = textAttributes
        }
    }
    
    fileprivate func setupRightBarButton(type: NavigationBarRight?) -> UIBarButtonItem? {
        guard let type = type else { return nil }
        switch type {
        case .none:
            return nil
        }
    }
}

