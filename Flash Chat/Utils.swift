//
//  Utils.swift
//  Flash Chat
//
//  Created by Robson Adorno Ferreira on 18/02/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit


class Utils {
    
     func showAlert(title:String, message:String, buttonText: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonText, style: .default, handler: nil))
        
        UIApplication.topViewController()?.present(alert, animated: true, completion:nil)
    }
    
}

extension UIApplication {
    
    static func topViewController(base: UIViewController? = UIApplication.shared.delegate?.window??.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}
