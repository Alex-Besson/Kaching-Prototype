//
//  Threshold_Changer.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-07.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class Threshold_Changer: NSObject {
    

    

    func addUserToItem(userID:String,myItemID:String,currCommit:Float) {
        
        
        
        let query = PFQuery(className: "UserToItem")
      dispatch_async(dispatch_get_main_queue()) { () -> Void in
        
        
        query.whereKey("username", equalTo: userID)
        query.whereKey("currentItem", equalTo: myItemID)
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            
        
         
            if error != nil {
                let myProduct = PFObject(className: "UserToItem")
                
                myProduct.setObject(userID, forKey: "username")
                myProduct.setObject(myItemID, forKey: "currentItem")
                myProduct.setObject(currCommit, forKey: "UserCommit")
                myProduct.setObject(true, forKey: "Viewed")
                
                myProduct.saveInBackground()
            } else {
                print("it exists")
            }

        }

    }
}
    func change (userID:String,myItemID:String,change:Float) {
       
        
        let query = PFQuery(className: "UserToItem")
        
        query.whereKey("username", equalTo: userID)
        query.whereKey("currentItem", equalTo: myItemID)
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
           
            if error == nil {
            guard let product = object else { return }
           
            product.setObject(change, forKey: "UserCommit")
                product.saveInBackground()
            
            }
            
        }
        
        
        
        
                
        
        }
}


    

