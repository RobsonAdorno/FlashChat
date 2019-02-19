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
    
    func especifyErrors(errorDescription:String){
        
        switch errorDescription {
        
        case "There is no user record corresponding to this identifier. The user may have been deleted.","The password is invalid or the user does not have a password.":
            showAlert(title: "Atencão", message: "Usuário ou senha inválidos", buttonText: "Ok")
            break
            
        case "The email address is badly formatted.":
            showAlert(title: "Atencão", message: "Formato de email inválido", buttonText: "Ok")
            break
            
        case "The password must be 6 characters long or more.":
            showAlert(title: "Atencão", message: "Password deve conter 6 caracteres ou mais", buttonText: "Ok")
            break
            
        default:
            showAlert(title: "Atencão", message: "Erro ao realizar o login", buttonText: "Ok")
            break
        }
        
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
