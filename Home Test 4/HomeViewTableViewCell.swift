//
//  HomeViewTableViewCell.swift
//  Home Test 4
//
//  Created by Miwand Najafe on 2015-10-05.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class HomeViewTableViewCell: UITableViewCell {

    @IBOutlet weak var Product_ProgressBar: UIProgressView!
    @IBOutlet weak var Product_DiscountPrice: UILabel!
    @IBOutlet weak var ProductImage: UIImageView!
    @IBOutlet weak var Product_Name: UILabel!
    @IBOutlet weak var Product_RetailPrice: UILabel!
    
    func configureColor() {
        self.backgroundColor = CustomColors.getViewBackgroundColor()
//        self.Product_DiscountPrice.textColor = CustomColors.getPriceLabelColor()
//        self.Product_RetailPrice.textColor = CustomColors.getPriceLabelColor()
//        self.Product_Name.textColor = CustomColors.getTitleTextColor()
    }
    
    
    var lblTitle = UILabel()
    var lblDiscountPrice = UILabel()
    var lblRetailPrice = UILabel()
    
    var imgProductImage = UIImageView()
    
    var pBarCommits = UIProgressView()
    
    let stkLabelStack = UIStackView()
    
    
    func configureCellElements() {
        self.stkLabelStack.addSubview(lblDiscountPrice)
        self.stkLabelStack.addSubview(lblRetailPrice)
        self.addSubview(imgProductImage)
        self.addSubview(pBarCommits)
        self.stkLabelStack.addSubview(lblTitle)
        
        lblTitle.font = UIFont(name: "Helvetica Neue", size: 20)
        lblDiscountPrice.font = UIFont(name: "Helvetica Neue", size: 16)
        lblRetailPrice.font = UIFont(name: "Helvetica Neue", size: 14)
        
        stkLabelStack.frame = CGRectMake(200, 10, 200, 90)
//        pBarCommits.frame = CGRectMake(self.bounds.width - 128, self.bounds.height - 28, 118, 10)
    }
    
    func setLabelText() -> String {
        return "Hello, World!"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureColor()
        configureCellElements()
        self.addSubview(stkLabelStack)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
