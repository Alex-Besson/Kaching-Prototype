import UIKit

class MainVC: UIViewController {
    @IBOutlet weak var firstNameEntry: UITextField!
    @IBOutlet weak var emailEntry: UITextField!
    @IBOutlet weak var passwordEntry: UITextField!

    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!

    
    var defaults = NSUserDefaults.standardUserDefaults()
    
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
        let defaults = self.defaults
        //  callSignup()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveAndDisplay(sender: AnyObject) {
        
        let userInfo = PFUser()
        
        //save data to ns user defaults
        //defaults.setObject(firstNameEntry.text, forKey: "savedfirstname")
        //        defaults.setObject(nameEntry.text, forKey: "savedname")
        //        defaults.setObject(passwordEntry.text, forKey: "savedemail")
        //        defaults.synchronize()
        //
        //if let fname = defaults.stringForKey("savedname") {
        //nameLabel.text = "First name: \(fname)"
        
        if let firstName = defaults.stringForKey("savedfirstname") {
            firstNameLabel.text = "First Name: \(firstName)"
            
            
        }
        
        if let email = defaults.stringForKey("savedemail") {
            emailLabel.text = "Email: \(email)"
            
        }
        if let password = defaults.stringForKey("savedpassword") {
            passwordLabel.text = "Password: \(password)"
            
        }
        
        
        
        userInfo.username = firstNameEntry.text!
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