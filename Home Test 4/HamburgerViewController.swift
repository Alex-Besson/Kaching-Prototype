//
//  HamburgerViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var btnMyCommits: UIButton!
    @IBOutlet weak var btnMyFavorites: UIButton!
    @IBOutlet weak var btnHistory: UIButton!
    @IBOutlet weak var btnContactUs: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureColors()
        configureHamButtons()
        
        
        self.view.layer.shadowOffset = CGSize(width: 6, height: 3)
        self.view.layer.shadowOpacity = 0.4
        self.view.layer.shadowRadius = 2
    }
    
    func configureColors() {
        self.view.backgroundColor = CustomColors.getDescriptionTextColor()
    }
    
    func configureHamButtons() {
        btnMyCommits.setTitleColor(CustomColors.getTitleTextColor(), forState: UIControlState.Normal)
        btnMyFavorites.setTitleColor(CustomColors.getTitleTextColor(), forState: UIControlState.Normal)
        btnHistory.setTitleColor(CustomColors.getTitleTextColor(), forState: UIControlState.Normal)
        btnContactUs.setTitleColor(CustomColors.getTitleTextColor(), forState: UIControlState.Normal)
        btnSettings.setTitleColor(CustomColors.getTitleTextColor(), forState: UIControlState.Normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
