//
//  ViewController.swift
//  Parse Foursquare Cln
//
//  Created by Atil Samancioglu on 29/06/2017.
//  Copyright © 2017 Atil Samancioglu. All rights reserved.
//

import UIKit
import Parse

class signInVC: UIViewController {

    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        
        
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
            
            PFUser.logInWithUsername(inBackground: usernameText.text!, password: passwordText.text!, block: { (user, error) in
                
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    
                    UserDefaults.standard.set(self.usernameText.text!, forKey: "userLoggedIn")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.rememberLogIn()
                    
                }
                
            })
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Username needed", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func signUpClicked(_ sender: Any) {
        
        if usernameText.text != "" && passwordText.text != "" {
            
            let user = PFUser()
            user.username = usernameText.text!
            user.password = passwordText.text!
            
            user.signUpInBackground(block: { (success, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertControllerStyle.alert)
                    let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
                    alert.addAction(okButton)
                    self.present(alert, animated: true, completion: nil)
                } else {
                    
                    UserDefaults.standard.set(self.usernameText.text!, forKey: "userLoggedIn")
                    UserDefaults.standard.synchronize()
                    
                    let delegate : AppDelegate = UIApplication.shared.delegate as! AppDelegate
                    delegate.rememberLogIn()
                    
                }
                
                
            })
            
        } else {
            let alert = UIAlertController(title: "Error", message: "Username needed", preferredStyle: UIAlertControllerStyle.alert)
            let okButton = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
            alert.addAction(okButton)
            self.present(alert, animated: true, completion: nil)
        }
        
        
        
    }
    
    

}

