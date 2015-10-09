//
//  Parse_ProductModel.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-05.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import Foundation

struct Parse_ProductModel {
    
var itemName:String?
var currentCommit:Float?
var threshold:Float?
var retailPrice:String?
var discountPrice:String?
    var itemId:String?
    var itemImageURL:String?
    var itemDescription:String?


    init(itemName:String,currentCommit:Float,threshold:Float,retailPrice:String,discountPrice:String,itemId:String,itemImageURL:String,itemDescription:String) {
    
    self.itemName = itemName
    self.currentCommit = currentCommit
    self.threshold = threshold
    self.retailPrice = retailPrice
    self.discountPrice = discountPrice
        self.itemId = itemId
        self.itemImageURL = itemImageURL
        self.itemDescription = itemDescription
   
}



}