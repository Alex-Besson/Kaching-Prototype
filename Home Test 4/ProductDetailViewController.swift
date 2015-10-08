//
//  ProductDetailViewController.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-05.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {

    var product: Parse_ProductModel!
    
    var itemImage:UIImage?
    var changedCommit:Float = 0
    let commitChanger = Threshold_Changer()
   
    
    @IBOutlet weak var productDetailImage: UIImageView!

    @IBOutlet weak var ProductDetailPBar: UIProgressView!
    @IBOutlet weak var ProductDescription: UILabel!
    @IBOutlet weak var ProductRetailPrice: UILabel!
    @IBOutlet weak var ProductDiscountPrice: UILabel!
    
    @IBAction func IAmIn(sender: AnyObject) {
        
        guard var itemCommitChanged = product.currentCommit else {return}
        
        itemCommitChanged++
         self.changedCommit = itemCommitChanged
        
        guard let itemID = product.itemId else {return}
        
      commitChanger.Change(itemID, change: itemCommitChanged)
        print(product.currentCommit)
    
    }
    
    @IBAction func IAmOut(sender: AnyObject) {
        
        
        
        
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let itemThreshold = product.threshold else {
            return
        }
       
         let itemProgressBar = self.changedCommit/itemThreshold
        
        self.productDetailImage.image = itemImage
        self.ProductDiscountPrice.text = product.discountPrice
        self.ProductRetailPrice.text = product.retailPrice
        self.ProductDetailPBar.setProgress(itemProgressBar, animated: true)
      
print(product)
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
