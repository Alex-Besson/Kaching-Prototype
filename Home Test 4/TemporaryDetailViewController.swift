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
    
    
    
    let pBarCommitProgress = UIProgressView()
    
    
    
    
    
    
    
    // VIEW DID LOAD
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        guard let itemThreshold = product.threshold else {
            return
        }
        
        guard let itemCommit = product.currentCommit else
        {
            return
        }
        
        counter = itemCommit
        
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
        
        configureImOutButton()
        
    }
    
    
    
    // UI ELEMENTS CONFIGURATION FUNCTIONS
    
    
    
    func configureTitleLabel() {
        
        lblTitle.frame = CGRectMake(self.view.bounds.width / 2 - 150, 30, 300, 100)
        
        self.view.addSubview(lblTitle)
        
        lblTitle.text = product.itemName!
        
        lblTitle.textAlignment = NSTextAlignment.Center
        
        lblTitle.textColor = UIColor(red: 15/255, green: 15/255, blue: 15/255, alpha: 1)
        
        lblTitle.font = lblTitle.font.fontWithSize(20)
        
    }
    
    
    
    func configureDescriptionLabel() {
        
        self.view.addSubview(lblDescription)
        
        lblDescription.frame = CGRectMake(self.view.bounds.width / 2 - 168, self.view.bounds.height / 2 - 50, 336, 220)
        
//        lblDescription.frame = CGRectInset(100.00, 100.00, 100.00)
        
    
        
        lblDescription.text = product.itemDescription
        
        lblDescription.font = UIFont(name: "Helvetica Neue", size: 14)
        
        lblDescription.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
        lblDescription.numberOfLines = 0
        
        lblDescription.lineBreakMode = NSLineBreakMode.ByWordWrapping
        
        lblDescription.textAlignment = NSTextAlignment.Justified
        
        lblDescription.backgroundColor = UIColor(red: 230/255, green: 230/255, blue: 230/255, alpha: 1)
        
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
        
        lblDiscountPrice.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
    }
    
    
    
    func configureRetailPriceLabel() {
        
        self.view.addSubview(lblRetailPrice)
        
        lblRetailPrice.frame = CGRectMake(self.view.bounds.width / 2 - 168, 540, 200, 50)
        
        lblRetailPrice.text = "Retail Price: $\(product.retailPrice!)"
        
        lblRetailPrice.textAlignment = NSTextAlignment.Left
        
        lblRetailPrice.textColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        
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
        
        //        btnCommit.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Selected)
        
        //        btnCommit.setTitleColor(UIColor.purpleColor(), forState: UIControlState.Normal)
        
        
        
    }
    
    //Commit button action
    
    func effectPBar(sender:UIButton!) {
        counter++
        
        
        guard let itemID = product.itemId else {return}
        
        commitChanger.Change(itemID, change: counter)
        
        pBarCommitProgress.ChangeProgressBar(counter, threshold: product.threshold!)
        print(counter)
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
        
        //        btnBuyNow.center = CGPoint(x: 300, y: 500)
        
    }
    
    
    
    func configureProgressView() {
        
        self.view.addSubview(pBarCommitProgress)
        
        pBarCommitProgress.frame = CGRectMake(self.view.bounds.width / 2 - 150, 600, 300, 100)
        
        
        
        let constraintPBarHeight : NSLayoutConstraint = NSLayoutConstraint(item: pBarCommitProgress, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 40)
        
        
        
        //        let heightConstraint = pBarCommitProgress.heightAnchor.constraintEqualToAnchor(nil, constant: 100)
        
        
        
        //        NSLayoutConstraint.activateConstraints([heightConstraint])
        
        //        self.view.addConstraint(heightConstraint)
        
        
        
        //        self.view.addConstraint(constraintPBarHeight)
        
        self.pBarCommitProgress.addConstraint(constraintPBarHeight)
        
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
        counter = 0
        pBarCommitProgress.ChangeProgressBar(counter, threshold: product.threshold!)
        
        guard let itemID = product.itemId else {return}
        commitChanger.Change(itemID, change: counter)
    }

    
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
        
    }

}
