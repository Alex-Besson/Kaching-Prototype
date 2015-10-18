//
//  LoginVC.swift
//  Home Test 4
//
//  Created by Reiss Zurbyk on 2015-10-15.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var usernameEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    
   

    
 
    
    func callSignup() {
        let userInfo = PFUser()
        userInfo.username = "Hello"
        userInfo.password = "monkeys"
        userInfo.signUpInBackgroundWithBlock { (succedded: Bool, error: NSError?) -> Void in
            if let error = error {
                print("user info")
            } else {
                print("login successful")
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func loginButton(sender: AnyObject) {
        let userInfo = PFUser()
        userInfo.username = usernameEntry.text!
        userInfo.password = passwordEntry.text!
        userInfo.signUpInBackgroundWithBlock { (succedded: Bool, error: NSError?) -> Void in
            if let error = error {
                print("user info")
            } else {
                print("login successful")
                
            }
            
        }
        
    }
}