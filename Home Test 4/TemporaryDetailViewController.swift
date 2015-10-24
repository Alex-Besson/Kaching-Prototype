//
//  TemporaryDetailViewController.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-09.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class TemporaryDetailViewController: UIViewController {

    // UI ELEMENTS
    
    var login = LogInViewController()
    
    var product: Parse_ProductModel!
    
    var counter:Float = 0
    
    
    let commitChanger = Threshold_Changer()
    
    let lblTitle = UILabel()
    let lblDescription = UILabel()
    let lblDiscountPrice = UILabel()
    let lblRetailPrice = UILabel()
    
    let imgItemImage = UIImageView()
    
    let btnCommit = UIButton(type: UIButtonType.System) as UIButton
    let btnBuyNow = UIButton(type: UIButtonType.System) as UIButton
    let btnImOut = UIButton(type: UIButtonType.System) as UIButton
    
    let btnLogOut = UIButton(type: UIButtonType.System) as UIButton
    
    let pBarCommitProgress = UIProgressView()
    
    
    let currentUser = PFUser.currentUser()
    
    
    
    
    // VIEW DID LOAD
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        guard let itemCommit = product.currentCommit else
        {
            return
        }
        
        counter = itemCommit
     
        
        
        if PFUser.currentUser() != nil {
            
            guard let username = PFUser.currentUser()!.objectId else {return}
            
            
            guard let myitemID = product.itemId else {return}
            
                
        
                
            self.commitChanger.addUserToItem(username, myItemID: myitemID, currCommit: itemCommit)
            
            
            btnLogOut.hidden = false
            configureLogOutButton()
           
            if counter > 0 {
            btnImOut.hidden = false
            configureImOutButton()
                
                
            } else {
                print("no user")
            }
        }
        
        
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.commitChanger.sendToMain(product.itemId!)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print("viewdidload")
        
        guard let itemThreshold = product.threshold else {
            return
        }
        guard let itemCommit = product.currentCommit else
        {
            return
        }

        
        
        
        
        pBarCommitProgress.ChangeProgressBar(itemCommit, threshold: itemThreshold)
        
        self.view.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        
        
       
        configureTitleLabel()
        configureDescriptionLabel()
        configureImageView()
        configureDiscountPriceLabel()
        configureRetailPriceLabel()
        configureCommitButton()
        configureBuyNowButton()
        configureProgressView()
        
        
        configureElementColors()
        
    }
    
    
    
    // UI ELEMENTS CONFIGURATION FUNCTIONS
    
    
    
    
    func configureTitleLabel() {
        lblTitle.frame = CGRectMake(self.view.bounds.width / 2 - 150, 30, 300, 100)
        self.view.addSubview(lblTitle)
        lblTitle.text = product.itemName!
        lblTitle.textAlignment = NSTextAlignment.Center
//        lblTitle.textColor = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)
//        lblTitle.font = lblTitle.font.fontWithSize(20)
        lblTitle.font = UIFont(name: "Helvetica Neue", size: 20)
        
    }
    
    func configureDescriptionLabel() {
        self.view.addSubview(lblDescription)
        lblDescription.frame = CGRectMake(self.view.bounds.width / 2 - 168, self.view.bounds.height / 2 - 50, 336, 220)
        lblDescription.text = product.itemDescription
        lblDescription.font = UIFont(name: "Helvetica Neue", size: 14)
        
//        lblDescription.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        lblDescription.numberOfLines = 0
        lblDescription.lineBreakMode = NSLineBreakMode.ByWordWrapping
        lblDescription.textAlignment = NSTextAlignment.Justified
//        lblDescription.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        lblDescription.layer.cornerRadius = 10
        lblDescription.clipsToBounds = true
        
        
    }
    
    func configureImageView() {
        self.view.addSubview(imgItemImage)
        imgItemImage.frame = CGRectMake(self.view.bounds.width / 2 - 168, 100, 336, 170)
        imgItemImage.imageFromUrl(product.itemImageURL!)
        imgItemImage.layer.cornerRadius = 10
        imgItemImage.clipsToBounds = true
        imgItemImage.contentMode = UIViewContentMode.ScaleAspectFill
        
    }
    
    func configureDiscountPriceLabel() {
        self.view.addSubview(lblDiscountPrice)
        lblDiscountPrice.frame = CGRectMake(self.view.bounds.width / 2 - 168, 500, 200, 50)
        lblDiscountPrice.text = "Discount Price: $\(product.discountPrice!)"
        lblDiscountPrice.textAlignment = NSTextAlignment.Left
        lblDiscountPrice.font = UIFont(name: "Helvetica Neue", size: 17)
//        lblDiscountPrice.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
    }
    
    func configureRetailPriceLabel() {
        self.view.addSubview(lblRetailPrice)
        lblRetailPrice.frame = CGRectMake(self.view.bounds.width / 2 - 168, 540, 200, 50)
        lblRetailPrice.text = "Retail Price: $\(product.retailPrice!)"
        lblRetailPrice.textAlignment = NSTextAlignment.Left
        lblRetailPrice.font = UIFont(name: "Helvetica Neue", size: 17)
//        lblRetailPrice.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
    }
    
    func configureCommitButton() {
        self.view.addSubview(btnCommit)
        btnCommit.frame = CGRectMake(self.view.bounds.width - 90, 510, 70, 30)
        btnCommit.setTitle("Commit!", forState: UIControlState.Normal)
        btnCommit.setTitleColor(UIColor.greenColor(), forState: UIControlState.Normal)
        btnCommit.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        btnCommit.layer.borderColor = UIColor.greenColor().CGColor
        btnCommit.layer.borderWidth = 1.0
        btnCommit.layer.cornerRadius = 8.0
        btnCommit.setTitleColor(UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1), forState: UIControlState.Highlighted)
        
        if btnCommit.highlighted {
            btnCommit.backgroundColor = UIColor.greenColor()
        } else {
            btnCommit.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        }
        
        
        
        btnCommit.addTarget(self, action: "effectPBar:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
    }
    
    // COMMIT ACTION BUTTON
    
    func effectPBar(sender:UIButton!) {
        
        if PFUser.currentUser() == nil {
//            self.presentViewController(login.logInViewController, animated: true, completion: nil)
           self.performSegueWithIdentifier("login", sender: self)
            
        } else {
            
        
        counter++
        
            if counter > 0 {
                btnImOut.hidden = false
                configureImOutButton()
                
                
            }
        guard let itemID = product.itemId else {return}
            
            guard let user = currentUser?.objectId else {return}
//            var userCommit =   counter - product.currentCommit!
            
        
        commitChanger.change(user, myItemID: itemID, change: counter)
        
        
        pBarCommitProgress.ChangeProgressBar(counter, threshold: product.threshold!)
        print(counter)
            

        }
    }
    
    
    func configureBuyNowButton() {
        self.view.addSubview(btnBuyNow)
        btnBuyNow.frame = CGRectMake(self.view.bounds.width - 90, 550, 70, 30)
        btnBuyNow.setTitle("Buy Now!", forState: UIControlState.Normal)
        btnBuyNow.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btnBuyNow.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        btnBuyNow.layer.borderColor = UIColor.redColor().CGColor
        btnBuyNow.layer.borderWidth = 1.0
        btnBuyNow.layer.cornerRadius = 8.0
        
        btnBuyNow.setTitleColor(UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1), forState: .Highlighted)
        
       
        
    }
    
    func configureLogOutButton() {
        
        self.view.addSubview(btnLogOut)
        
        btnLogOut.frame = CGRectMake(self.view.bounds.width - 80, 610, 70, 30)
        
        btnLogOut.setTitle("Log Out", forState: UIControlState.Normal)
        
        btnLogOut.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        
        
        
        btnLogOut.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        
        btnLogOut.layer.borderColor = UIColor.redColor().CGColor
        
        btnLogOut.layer.borderWidth = 1.0
        
        btnLogOut.layer.cornerRadius = 8.0
        
        
        
        btnLogOut.setTitleColor(UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1), forState: .Highlighted)
        btnLogOut.addTarget(self, action: "clientLogOut:", forControlEvents: UIControlEvents.TouchUpInside)
        
        
    }
    
    func clientLogOut(sender:UIButton!){
        PFUser.logOutInBackgroundWithBlock { (error) -> Void in
            if error != nil {
                print("error logging out")
                
            } else {
                print("log out successful")
                self.btnLogOut.hidden = true
                self.btnImOut.hidden = true
            }
        }
    }
    
    
    func configureProgressView() {
        
        
        
        pBarCommitProgress.frame = CGRectMake(self.view.bounds.width / 2 - 150, 600, 300, 100)
        
        self.pBarCommitProgress.transform = CGAffineTransformScale(self.pBarCommitProgress.transform, 1, 5)
        

        
        self.view.addSubview(pBarCommitProgress)
        
       
        
        
    }
    
    func configureImOutButton() {
        self.view.addSubview(btnImOut)
        btnImOut.frame = CGRectMake(self.view.bounds.width / 2 - 35, 615, 70, 30)
        btnImOut.setTitle("I'm Out", forState: UIControlState.Normal)
        btnImOut.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btnImOut.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        btnImOut.layer.borderColor = UIColor.redColor().CGColor
        btnImOut.layer.borderWidth = 1.0
        btnImOut.layer.cornerRadius = 8.0
        btnImOut.setTitleColor(UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1), forState: .Highlighted)
        btnImOut.addTarget(self, action: "clearPBar:", forControlEvents: UIControlEvents.TouchUpInside)

    }
    
    func clearPBar(sender:UIButton!) {
        guard let itemCommit = product.currentCommit else
        {
        return
        }
        counter = itemCommit - counter
        
        var actualPBar = itemCommit + counter
        pBarCommitProgress.ChangeProgressBar(actualPBar, threshold: product.threshold!)
        
        guard let itemID = product.itemId else {return}
        guard let user = currentUser?.objectId else {return}
        commitChanger.change(user, myItemID: itemID, change: counter)
    }
    
    func configureElementColors() {
//        self.view.backgroundColor = UIColor(red: 244/255, green: 244/255, blue: 240/255, alpha: 1)
        self.view.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        
        let customGrayColor = UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1)
        lblDescription.backgroundColor = customGrayColor
        lblTitle.textColor = UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
        lblDescription.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        lblRetailPrice.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        lblDiscountPrice.textColor = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
        
    }


    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

}
