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
        return UIColor(red: 28/255, green: 28/255, blue: 28/255, alpha: 1)
    }
    
    class func getViewBackgroundColor() -> UIColor {
        return UIColor(red: 255/255, green: 255/255, blue: 247/255, alpha: 1) //UIColor(red: 208/255, green: 217/255, blue: 221/255, alpha: 1) //UIColor(red: 232/255, green: 239/255, blue: 242/255, alpha: 1)//UIColor(red: 246/255, green: 247/255, blue: 248/255, alpha: 1) //UIColor(red: 100/255, green: 136/255, blue: 151/255, alpha: 1) //
    }
    
    class func getDescriptionTextColor() -> UIColor {
        return UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1)
    }
    
    class func getDescriptionBackgroundColor() -> UIColor {
        return UIColor(red: 235/255.0, green: 235/255.0, blue: 235/255.0, alpha: 1) //UIColor(red: 242/255, green: 239/255, blue: 194/255, alpha: 1) 
    }
    
    class func getPriceLabelColor() -> UIColor {
        return UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1)
    }
    
    class func getNavBarColor() -> UIColor {
        return  CustomColors.getTitleTextColor() //UIColor(red: 0/255, green:32/255, blue:43/255, alpha:1) //UIColor(red: 25/255, green: 52/255, blue: 65/255, alpha: 1)
    }
    
    class func getHamMenuColor() -> UIColor {
        return UIColor(red: 209/255, green: 219/255, blue: 189/255, alpha: 1)
    }
    
    class func getButtonColor() -> UIColor {
        return UIColor(red: 242/255, green: 227/255, blue: 148/255, alpha: 1)
    }
    
    class func getPBarBackgroundColor() -> UIColor {
        return UIColor(red: 250/255, green: 139/255, blue: 154/255, alpha: 1)
    }
    
    class func getPBarFillColor() -> UIColor {
        return UIColor(red: 76/255, green: 164/255, blue: 81/255, alpha: 1)
    }

}