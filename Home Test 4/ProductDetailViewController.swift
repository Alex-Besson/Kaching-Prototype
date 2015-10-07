//
//  ProductDetailViewController.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-05.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    
    var itemDiscountPrice:String?
    var itemRetailPrice:String?
   
    var itemImage:UIImage?
    var currentItemCommit:Float?
    var currentItemThreshold:Float?
    let commitChanger = Threshold_Changer()
    var currentItemID:String?
    var itemCommitChanged:Float = 0.00
    
    @IBOutlet weak var productDetailImage: UIImageView!

    @IBOutlet weak var ProductDetailPBar: UIProgressView!
    @IBOutlet weak var ProductDescription: UILabel!
    @IBOutlet weak var ProductRetailPrice: UILabel!
    @IBOutlet weak var ProductDiscountPrice: UILabel!
    
    @IBAction func IAmIn(sender: AnyObject) {
        
          itemCommitChanged = currentItemCommit!
        
        itemCommitChanged++
        
        guard let itemID = currentItemID else {return}
        
      commitChanger.Change(itemID, change: itemCommitChanged)
        print(currentItemCommit)
    
    }
    
    @IBAction func IAmOut(sender: AnyObject) {
        
        
        
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let itemProgressBar = itemCommitChanged/currentItemThreshold! as? Float else {
            return
        }
        
        self.productDetailImage.image = itemImage
        self.ProductDiscountPrice.text = itemDiscountPrice
        self.ProductRetailPrice.text = itemRetailPrice
        self.ProductDetailPBar.setProgress(itemProgressBar, animated: true)
      self.loadView()

        // Do any additional setup after loading the view.
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
