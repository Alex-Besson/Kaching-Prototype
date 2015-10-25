//
//  TemporaryDetailViewController.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-09.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class TemporaryDetailViewController: UIViewController, UIScrollViewDelegate {

    
    
    var login = LogInViewController()
    
    var product: Parse_ProductModel!
    
    var counter:Float = 0
    
    
    let commitChanger = Threshold_Changer()
    
    
    
    // UI ELEMENTS
    
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
    
    var scrollView = UIScrollView()
    var container = UIView()
    
    
    let currentUser = PFUser.currentUser()
    
    
    
    
    // VIEW DID APPEAR
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        guard let itemCommit = product.currentCommit else
        {
            return
        }
        
        counter = itemCommit
     
        
        
        if PFUser.currentUser()?.objectId != nil {
            
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
        
        let testPath = UIBezierPath()
        testPath.moveToPoint(CGPointMake(294.79 / 16, 552.79 / 16))
        testPath.addCurveToPoint(CGPointMake(218.36 / 16, 485.91 / 16), controlPoint1: CGPointMake(281.02 / 16, 537.35 / 16), controlPoint2: CGPointMake(246.62 / 16, 507.26 / 16))
        testPath.addCurveToPoint(CGPointMake(89.21 / 16, 382.21 / 16), controlPoint1: CGPointMake(134.61 / 16, 422.67 / 16), controlPoint2: CGPointMake(123.22 / 16, 413.52 / 16))
        testPath.addCurveToPoint(CGPointMake(0 / 16, 187.87 / 16), controlPoint1: CGPointMake(26.53 / 16, 324.49 / 16), controlPoint2: CGPointMake(-0.09 / 16, 266.51 / 16))
        testPath.addCurveToPoint(CGPointMake(13.41 / 16, 112.07 / 16), controlPoint1: CGPointMake(0.04 / 16, 149.49 / 16), controlPoint2: CGPointMake(2.66 / 16, 134.71 / 16))
        testPath.addCurveToPoint(CGPointMake(92.86 / 16, 27.72 / 16), controlPoint1: CGPointMake(31.65 / 16, 73.69 / 16), controlPoint2: CGPointMake(58.51 / 16, 45.16 / 16))
        testPath.addCurveToPoint(CGPointMake(169.8 / 16, 9.65 / 16), controlPoint1: CGPointMake(117.18 / 16, 15.36 / 16), controlPoint2: CGPointMake(129.18 / 16, 9.87 / 16))
        testPath.addCurveToPoint(CGPointMake(246.23 / 16, 28.1 / 16), controlPoint1: CGPointMake(212.29 / 16, 9.41 / 16), controlPoint2: CGPointMake(221.24 / 16, 14.37 / 16))
        testPath.addCurveToPoint(CGPointMake(314.45 / 16, 105.91 / 16), controlPoint1: CGPointMake(276.66 / 16, 44.81 / 16), controlPoint2: CGPointMake(307.97 / 16, 80.54 / 16))
        testPath.addLineToPoint(CGPointMake(318.45 / 16, 121.58 / 16))
        testPath.addLineToPoint(CGPointMake(328.31 / 16, 100 / 16))
        testPath.addCurveToPoint(CGPointMake(623.81 / 16, 103.03 / 16), controlPoint1: CGPointMake(384.02 / 16, -21.97 / 16), controlPoint2: CGPointMake(561.9 / 16, -20.15 / 16))
        testPath.addCurveToPoint(CGPointMake(628.19 / 16, 272.54 / 16), controlPoint1: CGPointMake(643.45 / 16, 142.11 / 16), controlPoint2: CGPointMake(645.6 / 16, 225.54 / 16))
        testPath.addCurveToPoint(CGPointMake(464.18 / 16, 452.22 / 16), controlPoint1: CGPointMake(605.47 / 16, 333.85 / 16), controlPoint2: CGPointMake(562.81 / 16, 380.59 / 16))
        testPath.addCurveToPoint(CGPointMake(321.2 / 16, 580.25 / 16), controlPoint1: CGPointMake(399.5 / 16, 499.19 / 16), controlPoint2: CGPointMake(326.3 / 16, 570.27 / 16))
        testPath.addCurveToPoint(CGPointMake(294.79 / 16, 552.79 / 16), controlPoint1: CGPointMake(315.29 / 16, 591.84 / 16), controlPoint2: CGPointMake(320.92 / 16, 582.06 / 16))
        testPath.closePath()
        //        testPath.
        
        var fillColor = UIColor.redColor()
        fillColor.setFill()

        testPath.fill()
        
        
        
        
        
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = testPath.CGPath
        shapeLayer.backgroundColor = UIColor.redColor().CGColor
        //        shapeLayer.strokeColor = CustomColors.getButtonColor().CGColor
        shapeLayer.lineWidth = 3
        
        let testView = UIView()
        self.view.addSubview(testView)
        testView.frame = CGRectMake(self.view.bounds.width - 120, self.view.bounds.height / 10, 100, 100)
        testView.layer.addSublayer(shapeLayer)

        
        let rightButton: UIButton = UIButton() //(UIButtonType.Custom)
        rightButton.frame = CGRectMake(0, 0, 40, 40)
//        rightButton.
//        rightButton.setImage(UIImage(named:"SignIn.jpg"), forState: UIControlState.Normal)
        rightButton.layer.addSublayer(shapeLayer)
//        rightButton.addTarget(self, action: "rightNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
        
        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: rightButton)
        
        self.navigationItem.setRightBarButtonItem(rightBarButtonItem, animated: true);
        
//        let barButton = UIBarButtonItem()
//        barButton.image = imgItemImage.image
//        
//        navigationController?.navigationItem.rightBarButtonItem = barButton
//        navigationController?.navigationItem.setRightBarButtonItem(barButton, animated: true)
        
    }
    
    // VIEW DID DISAPPEAR
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.commitChanger.sendToMain(product.itemId!)
        
    }
    
    // VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
       print("viewdidload")
        btnImOut.hidden = true
        guard let itemThreshold = product.threshold else {
            return
        }
        guard let itemCommit = product.currentCommit else
        {
            return
        }

        
        
        pBarCommitProgress.ChangeProgressBar(itemCommit, threshold: itemThreshold)
        
//        self.view.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        
        setUpViewAndScrollView()
        
        configureTitleLabel()
        configureDescriptionLabel()
        configureImageView()
        configureDiscountPriceLabel()
        configureRetailPriceLabel()
        configureCommitButton()
        configureBuyNowButton()
        configureProgressView()
        configureImOutButton()
        
        createAndSetupHeartButton()
        
        configureElementColors()
        
    }
    
    
    
    // UI ELEMENTS CONFIGURATION FUNCTIONS
    
    func setUpViewAndScrollView() {
        self.view.backgroundColor = CustomColors.getViewBackgroundColor()
        scrollView.backgroundColor = CustomColors.getViewBackgroundColor()
        self.view.addSubview(scrollView)
        
//        self.scrollView = UIScrollView()
        self.scrollView.delegate = self
        
        
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 700)
        
//        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: 600)
        
        
        
        scrollView.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
//        scrollView.addSubview(container)
//        container.frame = CGRectMake(0, 0, self.view.bounds.width, self.view.bounds.height)
//        container.backgroundColor = CustomColors.getViewBackgroundColor()
//        container.userInteractionEnabled = true
        scrollView.userInteractionEnabled = true
        
        
    }
    
    
    func configureTitleLabel() {
        lblTitle.frame = CGRectMake(self.view.bounds.width / 2 - 150, self.view.bounds.width / 20, 300, self.view.bounds.height / 20)
//        self.view.addSubview(lblTitle)
        self.scrollView.addSubview(lblTitle)
        lblTitle.text = product.itemName!
        lblTitle.textAlignment = NSTextAlignment.Center
//        lblTitle.textColor = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)
//        lblTitle.font = lblTitle.font.fontWithSize(20)
        lblTitle.font = UIFont(name: "Helvetica Neue", size: 20)
        
    }
    
    func configureDescriptionLabel() {
//        self.view.addSubview(lblDescription)
        self.scrollView.addSubview(lblDescription)
        
        let descriptionWidth = self.view.bounds.width - 40
        let descriptionHeight = descriptionWidth / 2
        let tenthOfView = self.view.bounds.height / 10
        
        
        lblDescription.frame = CGRectMake(self.view.bounds.width / 2 - descriptionWidth / 2, descriptionHeight + tenthOfView + 10, descriptionWidth, descriptionHeight)
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
//        self.view.addSubview(imgItemImage)
        self.scrollView.addSubview(imgItemImage)
        
        let imageWidth = self.view.bounds.width - 40
        let viewHeight = self.view.bounds.height
        let tenthOfView = viewHeight / 10
        
        imgItemImage.frame = CGRectMake(self.view.bounds.width / 2 - imageWidth / 2, tenthOfView, imageWidth, imageWidth / 2)
        imgItemImage.imageFromUrl(product.itemImageURL!)
        imgItemImage.layer.cornerRadius = 10
        imgItemImage.clipsToBounds = true
        imgItemImage.contentMode = UIViewContentMode.ScaleAspectFill
        
    }
    
    func configureDiscountPriceLabel() {
//        self.view.addSubview(lblDiscountPrice)
        self.scrollView.addSubview(lblDiscountPrice)
        
        let tenthOfView = self.view.bounds.height / 10
        let imageViewWidth = self.view.bounds.width - 40
        let imageViewHeight = (self.view.bounds.width - 40) / 2
        
        lblDiscountPrice.frame = CGRectMake(self.view.bounds.width / 2 - imageViewWidth / 2, imageViewHeight * 2 + tenthOfView + 10, 200, 50)
        lblDiscountPrice.text = "Discount Price: $\(product.discountPrice!)"
        lblDiscountPrice.textAlignment = NSTextAlignment.Left
        lblDiscountPrice.font = UIFont(name: "Helvetica Neue", size: 17)
//        lblDiscountPrice.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
    }
    
    func configureRetailPriceLabel() {
//        self.view.addSubview(lblRetailPrice)
        self.scrollView.addSubview(lblRetailPrice)
        
        let tenthOfView = self.view.bounds.height / 10
        let imageViewWidth = self.view.bounds.width - 40
        let imageViewHeight = (self.view.bounds.width - 40) / 2
        
        
        lblRetailPrice.frame = CGRectMake(self.view.bounds.width / 2 - imageViewWidth / 2, imageViewHeight * 2 + tenthOfView + 40, 200, 50)
        lblRetailPrice.text = "Retail Price: $\(product.retailPrice!)"
        lblRetailPrice.textAlignment = NSTextAlignment.Left
        lblRetailPrice.font = UIFont(name: "Helvetica Neue", size: 17)
//        lblRetailPrice.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
    }
    
    func configureCommitButton() {
//        self.view.addSubview(btnCommit)
        self.scrollView.addSubview(btnCommit)
        
        btnCommit.frame = CGRectMake(self.view.bounds.width - 90, 510, 70, 30)
        btnCommit.setTitle("Commit!", forState: UIControlState.Normal)
        btnCommit.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
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
//        self.view.addSubview(btnBuyNow)
        scrollView.addSubview(btnBuyNow)
        
        btnBuyNow.frame = CGRectMake(self.view.bounds.width - 90, 550, 70, 30)
        btnBuyNow.setTitle("Buy Now!", forState: UIControlState.Normal)
        btnBuyNow.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
        btnBuyNow.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        btnBuyNow.backgroundColor = UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
        btnBuyNow.layer.borderColor = UIColor.redColor().CGColor
        btnBuyNow.layer.borderWidth = 1.0
        btnBuyNow.layer.cornerRadius = 8.0
        
        btnBuyNow.setTitleColor(UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1), forState: .Highlighted)
        
       
        
    }
    
    func configureLogOutButton() {
        
//        self.view.addSubview(btnLogOut)
        scrollView.addSubview(btnLogOut)
        
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
        scrollView.addSubview(pBarCommitProgress)
        
        pBarCommitProgress.frame = CGRectMake(self.view.bounds.width / 2 - 150, 600, 300, 100)
        
        self.pBarCommitProgress.transform = CGAffineTransformScale(self.pBarCommitProgress.transform, 1, 5)
    
    }
    
    func configureImOutButton() {
//        self.view.addSubview(btnImOut)
        scrollView.addSubview(btnImOut)
        
        btnImOut.frame = CGRectMake(self.view.bounds.width / 2 - 35, 560, 70, 30)
        btnImOut.setTitle("I'm Out", forState: UIControlState.Normal)
        btnImOut.titleLabel?.font = UIFont(name: "Helvetica Neue", size: 16)
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
        
        let actualPBar = itemCommit + counter
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
    
    // HEART BUTTON
    
    func createAndSetupHeartButton() {
        let testPath = UIBezierPath()
        testPath.moveToPoint(CGPointMake(294.79 / 16, 552.79 / 16))
        testPath.addCurveToPoint(CGPointMake(218.36 / 16, 485.91 / 16), controlPoint1: CGPointMake(281.02 / 16, 537.35 / 16), controlPoint2: CGPointMake(246.62 / 16, 507.26 / 16))
        testPath.addCurveToPoint(CGPointMake(89.21 / 16, 382.21 / 16), controlPoint1: CGPointMake(134.61 / 16, 422.67 / 16), controlPoint2: CGPointMake(123.22 / 16, 413.52 / 16))
        testPath.addCurveToPoint(CGPointMake(0 / 16, 187.87 / 16), controlPoint1: CGPointMake(26.53 / 16, 324.49 / 16), controlPoint2: CGPointMake(-0.09 / 16, 266.51 / 16))
        testPath.addCurveToPoint(CGPointMake(13.41 / 16, 112.07 / 16), controlPoint1: CGPointMake(0.04 / 16, 149.49 / 16), controlPoint2: CGPointMake(2.66 / 16, 134.71 / 16))
        testPath.addCurveToPoint(CGPointMake(92.86 / 16, 27.72 / 16), controlPoint1: CGPointMake(31.65 / 16, 73.69 / 16), controlPoint2: CGPointMake(58.51 / 16, 45.16 / 16))
        testPath.addCurveToPoint(CGPointMake(169.8 / 16, 9.65 / 16), controlPoint1: CGPointMake(117.18 / 16, 15.36 / 16), controlPoint2: CGPointMake(129.18 / 16, 9.87 / 16))
        testPath.addCurveToPoint(CGPointMake(246.23 / 16, 28.1 / 16), controlPoint1: CGPointMake(212.29 / 16, 9.41 / 16), controlPoint2: CGPointMake(221.24 / 16, 14.37 / 16))
        testPath.addCurveToPoint(CGPointMake(314.45 / 16, 105.91 / 16), controlPoint1: CGPointMake(276.66 / 16, 44.81 / 16), controlPoint2: CGPointMake(307.97 / 16, 80.54 / 16))
        testPath.addLineToPoint(CGPointMake(318.45 / 16, 121.58 / 16))
        testPath.addLineToPoint(CGPointMake(328.31 / 16, 100 / 16))
        testPath.addCurveToPoint(CGPointMake(623.81 / 16, 103.03 / 16), controlPoint1: CGPointMake(384.02 / 16, -21.97 / 16), controlPoint2: CGPointMake(561.9 / 16, -20.15 / 16))
        testPath.addCurveToPoint(CGPointMake(628.19 / 16, 272.54 / 16), controlPoint1: CGPointMake(643.45 / 16, 142.11 / 16), controlPoint2: CGPointMake(645.6 / 16, 225.54 / 16))
        testPath.addCurveToPoint(CGPointMake(464.18 / 16, 452.22 / 16), controlPoint1: CGPointMake(605.47 / 16, 333.85 / 16), controlPoint2: CGPointMake(562.81 / 16, 380.59 / 16))
        testPath.addCurveToPoint(CGPointMake(321.2 / 16, 580.25 / 16), controlPoint1: CGPointMake(399.5 / 16, 499.19 / 16), controlPoint2: CGPointMake(326.3 / 16, 570.27 / 16))
        testPath.addCurveToPoint(CGPointMake(294.79 / 16, 552.79 / 16), controlPoint1: CGPointMake(315.29 / 16, 591.84 / 16), controlPoint2: CGPointMake(320.92 / 16, 582.06 / 16))
        testPath.closePath()
        //        testPath.
        testPath.fill()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = testPath.CGPath
        shapeLayer.backgroundColor = UIColor.redColor().CGColor
        //        shapeLayer.strokeColor = CustomColors.getButtonColor().CGColor
        shapeLayer.lineWidth = 3
        
        let testView = UIView()
        self.view.addSubview(testView)
        testView.frame = CGRectMake(self.view.bounds.width - 120, self.view.bounds.height / 10, 100, 100)
        testView.layer.addSublayer(shapeLayer)
    }



    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

}
