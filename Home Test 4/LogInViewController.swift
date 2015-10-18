//
//  LogInViewController.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-18.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit



class LogInViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {

    var logInViewController = PFLogInViewController()
    var signUpViewController = PFSignUpViewController()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (PFUser.currentUser() == nil){
            
            
            
            self.logInViewController.delegate = self
         
            self.signUpViewController.delegate = self
            self.logInViewController.signUpController = self.signUpViewController
            
            self.presentViewController(logInViewController, animated: true, completion: nil)
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Parse Log in
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        if (!username.isEmpty || !password.isEmpty) {
            return true
        } else {
            return false
        }
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("Failed to login")
    }
   
    
    //Parse Sign up
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Failed To sign up")
    }
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        print("User cancelled sign up")
    }
    
        
}
