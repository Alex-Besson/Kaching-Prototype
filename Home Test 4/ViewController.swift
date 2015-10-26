//
//  ViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var hamIsOpen = false
    

    
    @IBOutlet weak var hamLeftConstraint: NSLayoutConstraint!
    
    @IBAction func btnHamburger(sender: AnyObject) {
        if !hamIsOpen {
            open()
        } else {
            close()
        }
        hamIsOpen = !hamIsOpen
    }
    
    @IBOutlet weak var btnHamburgerButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = CustomColors.getNavBarColor()
        self.navigationController?.navigationBar.backgroundColor = CustomColors.getNavBarColor()
        
        let startPoint = CGPointMake(0.0, (navigationController?.navigationBar.bounds.height)!)
        let endPoint = CGPointMake((navigationController?.navigationBar.bounds.width)!, ((navigationController?.navigationBar.bounds.height)!))
        let path = UIBezierPath()
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = CustomColors.getButtonColor().CGColor
        shapeLayer.lineWidth = 3
        
        navigationController?.navigationBar.layer.addSublayer(shapeLayer)
        
        navigationController?.navigationItem.leftBarButtonItem?.tintColor = CustomColors.getButtonColor()
        
        btnHamburgerButton.tintColor = CustomColors.getButtonColor()
        
        let rightButton = UIBarButtonItem()
        rightButton.tintColor = CustomColors.getButtonColor()
        

        // SETTING UP BEZIER
        
//        let path2 = UIBezierPath()
//        path.moveToPoint(CGPointMake(5, 5))
//        path.addLineToPoint(CGPointMake(40, 40))
//        
//        let hamLine = CAShapeLayer()
//        hamLine.path = path2.CGPath
//        hamLine.backgroundColor = UIColor.redColor().CGColor
//        //        shapeLayer.strokeColor = CustomColors.getButtonColor().CGColor
//        hamLine.lineWidth = 3
//        hamLine.fillColor = UIColor.redColor().CGColor
//        
//        
//        
//        let leftButton: UIButton = UIButton()
//        leftButton.frame = CGRectMake(0, 0, 40, 40)
//        //        rightButton.
//        //        rightButton.setImage(UIImage(named:"SignIn.jpg"), forState: UIControlState.Normal)
//        leftButton.layer.addSublayer(hamLine)
//        //        rightButton.addTarget(self, action: "rightNavButtonClick:", forControlEvents: UIControlEvents.TouchUpInside)
//        
//        let rightBarButtonItem: UIBarButtonItem = UIBarButtonItem(customView: leftButton)
//        
//        self.navigationItem.setLeftBarButtonItem(rightBarButtonItem, animated: true)

    }
    
    func open() {
        hamLeftConstraint.constant = 0
        UIView.animateWithDuration(0.3) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    func close() {
        hamLeftConstraint.constant = -260
        UIView.animateWithDuration(0.3) { () -> Void in
            self.view.layoutIfNeeded()
        }
    }
    
    func configureColors() {
        self.view.backgroundColor = CustomColors.getViewBackgroundColor()
    }
    
    override func viewDidAppear(animated: Bool) {

            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

