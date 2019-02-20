//
//  LogInViewController.swift
//  Flash Chat
//
//  This is the view controller where users login


import UIKit
import Firebase
import SVProgressHUD

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
        
        SVProgressHUD.show()
        
        Auth.auth().signIn(withEmail: emailTextfield.text!, password: passwordTextfield.text!) {
            (sucess, error) in
            
            if let error = error{
                
                self.alert.especifyErrors(errorDescription: error.localizedDescription)
                NSLog("Description: \(error)")
            }else{
                
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
        
      
    }
}  
