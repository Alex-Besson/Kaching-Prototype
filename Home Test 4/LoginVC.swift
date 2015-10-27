//
//  LoginVC.swift
//  Home Test 4
//
//  Created by Reiss Zurbyk on 2015-10-15.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var emailEntry: UITextField!
    @IBOutlet weak var usernameEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        if PFUser.currentUser() != nil {
            //            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    
    //    @IBOutlet weak var usernameLabel: UILabel!
    //    @IBOutlet weak var passwordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayMyAlertMessage(userMessage:String)
    {
        
        var myAlert = UIAlertController(title:"Alert", message:userMessage, preferredStyle: UIAlertControllerStyle.Alert);
        
        let okAction = UIAlertAction(title:"Ok", style:UIAlertActionStyle.Default, handler:nil);
        
        myAlert.addAction(okAction);
        
        self.presentViewController(myAlert, animated:true, completion:nil);
        
    }
    
    func checkMyUser(username:String,userPass:String) {
        let query = PFQuery(className: "User")
        query.whereKey("username", containsString: username)
        query.whereKey("password", containsString: userPass)
        //query.whereKey("email", containsString: userEmail)
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            if error != nil {
                print("user does not exist")
            } else {
                PFUser.logInWithUsernameInBackground(username, password: userPass)
                
            }
            
        }
    }
    
    @IBAction func loginButton(sender: AnyObject) {
        
        let userInfo = PFUser()
        userInfo.email = emailEntry.text
        userInfo.username = usernameEntry.text!
        userInfo.password = passwordEntry.text!
        
        PFUser.logInWithUsernameInBackground(userInfo.username!, password: userInfo.password!)
//        let userEmail = emailEntry.text;
//        let userName = usernameEntry.text;
//        let userPassword = passwordEntry.text;
//        
//        checkMyUser(userName!, userPass: userPassword!)
//        
//        let userEmailStored = NSUserDefaults.standardUserDefaults().stringForKey("userEmail");
//        let usernameStored = NSUserDefaults.standardUserDefaults().stringForKey("userName");
//        let userPasswordStored = NSUserDefaults.standardUserDefaults().stringForKey("userPassword");
//        
//        if(userEmailStored == userEmail) {
//            //} else {
//            //displayMyAlertMessage("Double check your email address");
//            return;
//        }
//        
//        if(usernameStored == userName) {
//            //} else {
//            //displayMyAlertMessage("You must have used a different username");
//            return;
//        }
//        
//        if(userPasswordStored == userPassword) {
//            //} else {
//            //displayMyAlertMessage("Password incorrect");
//            
//            return;
//        }
//        // Login is successfull
//        NSUserDefaults.standardUserDefaults().setBool(true,forKey:"userIsLoggedIn");
//        NSUserDefaults.standardUserDefaults().synchronize();
        
        self.dismissViewControllerAnimated(true, completion:nil);
        
}
}