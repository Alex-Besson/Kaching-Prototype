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
//        self.backgroundColor = CustomColors.getViewBackgroundColor()
//        self.Product_DiscountPrice.textColor = CustomColors.getPriceLabelColor()
//        self.Product_RetailPrice.textColor = CustomColors.getPriceLabelColor()
//        self.Product_Name.textColor = CustomColors.getTitleTextColor()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        configureColor()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
