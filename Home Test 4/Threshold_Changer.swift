//
//  Threshold_Changer.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-07.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class Threshold_Changer: NSObject {

    
    
    func Change (myItemID:String,change:Float) {
        
        let query = PFQuery(className: "ItemList")
        query.getObjectInBackgroundWithId(myItemID) { (object, error) -> Void in
            if error != nil {
                print(error)
            } else {
                
                guard let product = object else {return}
                
                product["CurrentCommit"] = change
                product.saveInBackground()
            }
        }
    }
    
}
