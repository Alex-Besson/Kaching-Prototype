//
//  Threshold_Changer.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-07.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class Threshold_Changer: NSObject {
    
    var userCommit = [Float]()
    

    func addUserToItem(userID:String,myItemID:String,currCommit:Float) {
        
        
        
        let query = PFQuery(className: "UserToItem")
  
        
        
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
    
    func sendToMain (myItemID:String) {
        
        
        let query = PFQuery(className: "UserToItem")
        
        
        query.whereKey("currentItem", equalTo: myItemID)
        
            query.findObjectsInBackgroundWithBlock { (object, error) -> Void in 
        
        
            if error == nil {
                guard let commits = object else { return }
                var values = [Float]()
                for commit in commits {
                    guard let userCommit = commit.objectForKey("UserCommit") as? Float else { return}
                    values.append(userCommit)
                    print(values)
                }
              let sum = values.reduce(0, combine: +)
               self.sendingCommits(myItemID, change: sum)
                
            }
            
        }
        
    }
    
    func sendingCommits (myItemID:String,change:Float) {
        
       
        let query = PFQuery(className: "ItemList")
        
        
        query.whereKey("objectId", equalTo: myItemID)
        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
            
            if error == nil {
                guard let product = object else { return }
                
                
                
                product.setObject(change, forKey: "CurrentCommit")
                product.saveInBackground()
                
            }
            
        }
        
    }
    
    
//    func getMyUserCommit (userID:String,itemID:String) {
//        let query = PFQuery(className: "UserToITem")
//        query.whereKey("username", containsString: userID)
//        query.whereKey("currentItem", containsString: itemID)
//        query.getFirstObjectInBackgroundWithBlock { (object, error) -> Void in
//            if error == nil {
//                guard let myCommit = object?.objectForKey("UserCommit") as? Float else {return}
//                let defaults = NSUserDefaults.standardUserDefaults()
//                
//                defaults.s
//                defaults.synchronize()
//                
//                
//            }
//        }
//        
//    }
    
}


    

