//
//  ProductDetailViewController.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-05.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    @IBOutlet weak var productDetailImage: UIImageView!

    @IBOutlet weak var ProductDetailPBar: UIProgressView!
    @IBOutlet weak var ProductDescription: UILabel!
    @IBOutlet weak var ProductRetailPrice: UILabel!
    @IBOutlet weak var ProductDiscountPrice: UILabel!
    
    var itemDiscountPrice:String?
    var itemRetailPrice:String?
    var itemProgressBar:Float?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.ProductDiscountPrice.text = itemDiscountPrice
        self.ProductRetailPrice.text = itemRetailPrice
        self.ProductDetailPBar.setProgress(itemProgressBar!, animated: true)

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
