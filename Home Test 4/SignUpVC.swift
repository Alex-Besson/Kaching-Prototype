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
    
//    @IBOutlet weak var userNameLabel: UILabel!
//    @IBOutlet weak var firstNameLabel: UILabel!
//    @IBOutlet weak var lastNameLabel: UILabel!
//    @IBOutlet weak var emailLabel: UILabel!
//    @IBOutlet weak var passwordLabel: UILabel!
    
    //    var defaults = NSUserDefaults.standardUserDefaults()
    
    //    func callSignup() {
    //        var userInfo = PFUser()
    //        userInfo.username = "Reiss"
    //        userInfo.password = "monkeys"
    //        userInfo.signUpInBackgroundWithBlock { (succedded: Bool, error: NSError?) -> Void in
    //            if let error = error {
    //                print("user info")
    //            } else {
    //                print("login successful")
    //            }
    //
    //        }
    //    }
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        //set defaults
        //        let defaults = self.defaults
        
        //  callSignup()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
   
    @IBAction func signInButton(sender: AnyObject) {
    
        
        let userInfo = PFUser()
        
        //save data to ns user defaults
        //defaults.setObject(firstNameEntry.text, forKey: "savedfirstname")
        //        defaults.setObject(nameEntry.text, forKey: "savedname")
        //        defaults.setObject(passwordEntry.text, forKey: "savedemail")
        //        defaults.synchronize()
        //
        //if let fname = defaults.stringForKey("savedname") {
        //nameLabel.text = "First name: \(fname)"
        
        //        if let userName = defaults.stringForKey("savedusername") {
        //            userNameLabel.text = "User Name: \(userName)"
        //
        //        }
        //
        //        if let firstName = defaults.stringForKey("savedfirstname") {
        //            firstNameLabel.text = "First Name: \(firstName)"
        //
        //        }
        //        if let lastName = defaults.stringForKey("savedlastname") {
        //            lastNameLabel.text = "Last Name: \(lastName)"
        //
        //        }
        //
        //        if let email = defaults.stringForKey("savedemail") {
        //            emailLabel.text = "Email: \(email)"
        //
        //        }
        //
        //        if let password = defaults.stringForKey("savedpassword") {
        //            passwordEntry.text = "Password: \(password)"
        //
        //        }
        
        
        //userInfo.firstName = firstNameEntry.text!
        //userInfo.username = ["\(firstNameEntry.text) \(lastNameEntry.text)"]
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