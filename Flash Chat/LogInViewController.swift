//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase

class LogInViewController: UIViewController {
    
    //MARK: Constants
    let alert = Utils()

    //Textfields pre-linked with IBOutlets
    @IBOutlet var emailTextfield: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

   
    @IBAction func logInPressed(_ sender: AnyObject) {
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (sucess, error) in
            
            if let error = error{
                
                self.alert.showAlert(title: "Atencão", message: "Error ao realizar o login", buttonText: "Ok")
                NSLog("Description: \(error)")
            }else{
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
      
    }
}  
