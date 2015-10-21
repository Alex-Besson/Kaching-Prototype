//
//  CustomColors.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-19.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation

class CustomColors {
    let customGrayBackgroundColor = UIColor(red: 245/255.0, green: 245/255.0, blue: 245/255.0, alpha: 1)
    let customGrayDescriptionTextColor = UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1)
    
    
    class func getTitleTextColor() -> UIColor {
        return UIColor(red: 25/255, green: 52/255, blue: 65/255, alpha: 1) //UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
    }
    
    class func getViewBackgroundColor() -> UIColor {
        return UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1)
    }
    
    class func getDescriptionTextColor() -> UIColor {
        return UIColor(red: 209/255, green: 219/255, blue: 189/255, alpha: 1)//UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1)
    }
    
    class func getDescriptionBackgroundColor() -> UIColor {
        return UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1)
    }
    
    class func getPriceLabelColor() -> UIColor {
        return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    }
    
    

}