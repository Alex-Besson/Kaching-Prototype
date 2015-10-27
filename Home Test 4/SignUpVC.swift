//
//  SignUpVC.swift
//  Home Test 4
//
//  Created by Reiss Zurbyk on 2015-10-15.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    
    @IBOutlet weak var usernameEntry: UITextField!
    @IBOutlet weak var firstNameEntry: UITextField!
    @IBOutlet weak var lastNameEntry: UITextField!
    @IBOutlet weak var emailEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    @IBOutlet weak var repeatPasswordEntry: UITextField!
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //        var defaults = NSUserDefaults.standardUserDefaults()
    //
    //        func callSignup() {
    //            var userInfo = PFUser()
    //            //userInfo.username = "Reiss"
    //            //userInfo.password = "monkeys"
    //            userInfo.signUpInBackgroundWithBlock { (succedded: Bool, error: NSError?) -> Void in
    //                if let error = error {
    //                    print("user info")
    //                } else {
    //                    print("login successful")
    //                }
    //
    //            }
    //        }
    
    
    // Do any additional setup after loading the view.
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signUpButton(sender: AnyObject) {
        
        let userUsername = usernameEntry.text;
        let userFirstName = firstNameEntry.text;
        let userLastName = lastNameEntry.text;
        let userEmail = emailEntry.text;
        let userPassword = passwordEntry.text;
        let userRepeatPassword = repeatPasswordEntry.text;
        
        //check for empty fields
        
        if(userEmail!.isEmpty || userPassword!.isEmpty || userRepeatPassword!.isEmpty) {
            
            
            //display alert message
            
            displayMyAlertMessage("All fields are required");
            
            return;
        }
        
        //check if passwords match
        
        if(userPassword != userRepeatPassword) {
            
            // Display an alert message
            displayMyAlertMessage("Passwords do not match");
            return;
            
        }
        
        //set defaults and store data
        let userInfo = PFUser()
        userInfo.setObject(firstNameEntry.text!, forKey: "firstName")
        userInfo.setObject(lastNameEntry.text!, forKey: "lastName")
        userInfo.username = usernameEntry.text!
        userInfo.email = emailEntry.text!
        userInfo.password = passwordEntry.text
        
        userInfo.signUpInBackgroundWithBlock { (succedded: Bool, error: NSError?) -> Void in
            
            print("User successfully registered")
            // Display alert message with confirmation.
            var myAlert = UIAlertController(title:"Alert", message:"Registration is successful. Thank you!", preferredStyle: UIAlertControllerStyle.Alert);
            
            let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default){ action in
                self.dismissViewControllerAnimated(true, completion:nil);
            }
            
            myAlert.addAction(okAction);
            self.presentViewController(myAlert, animated:true, completion:nil);
            
            
        }
        
        
        
        
        
        
    }
    
    
    func displayMyAlertMessage(userMessage:String)
    {
        
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }
    
    @IBAction func iHaveAnAccountButton(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}