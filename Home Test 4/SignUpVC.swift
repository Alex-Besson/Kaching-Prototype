//
//  SignUpVC.swift
//  Home Test 4
//
//  Created by Reiss Zurbyk on 2015-10-15.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var userNameEntry: UITextField!
    @IBOutlet weak var firstNameEntry: UITextField!
    @IBOutlet weak var lastNameEntry: UITextField!
    @IBOutlet weak var emailEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    @IBAction func signInButton(sender: AnyObject) {
    
        
        let userInfo = PFUser()
        
       
        userInfo.setObject(firstNameEntry.text!, forKey: "firstName")
        userInfo.setObject(lastNameEntry.text!, forKey: "lastName")
        userInfo.username = userNameEntry.text!
        userInfo.email = emailEntry.text!
        userInfo.password = passwordEntry.text
        userInfo.signUpInBackgroundWithBlock { (succedded: Bool, error: NSError?) -> Void in
            if let error = error {
                print("user info")
            } else {
                print("login successful")
            }
            
        }
    }
}