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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = CustomColors.getNavigationBarColor()
        self.navigationController?.navigationBar.backgroundColor = CustomColors.getNavigationBarColor()
        
        let startPoint = CGPointMake(0.0, (navigationController?.navigationBar.bounds.height)!)
        let endPoint = CGPointMake((navigationController?.navigationBar.bounds.width)!, (navigationController?.navigationBar.bounds.height)!)
        let path = UIBezierPath()
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = UIColor.yellowColor().CGColor
        shapeLayer.lineWidth = 2.5
        
        navigationController?.navigationBar.layer.addSublayer(shapeLayer)
        
//        layer.addSublayer(shapeLayer)


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
        self.view.backgroundColor = CustomColors.getDescriptionTextColor()
    }
    
    override func viewDidAppear(animated: Bool) {

            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

