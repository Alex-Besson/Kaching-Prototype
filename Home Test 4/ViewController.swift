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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

