//
//  HomeViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

var dataArray = ["iPhone 6", "iPhone 6 Plus", "Crappy Samsung Phone", "Another Crappy Samsung Phone", "Vacuum Cleaner", "SONY 4K TV", "Samsung 4K TV", "iPad Pro", "Silicon Valley: Complete First Season", "Lamp", "La-Z Boy Chair", "1977 Gibson Les Paul Guitar", "Fender Jazz Bass", "The Big Bang Theory: Complete Series"]

var filteredArray = [String]()

var shouldShowSearchResults = false



class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, CustomSearchControllerDelegate {
    var products = [Parse_ProductModel]()
    let productControllers = ProductController()

    @IBOutlet weak var tblSearchResults: UITableView!
    
    var customSearchController: CustomSearchController!
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, tblSearchResults.frame.size.width, 50.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.purpleColor(), searchBarTintColor: UIColor.blackColor())
        
        customSearchController.customSearchBar.placeholder = "Search here..."
        tblSearchResults.tableHeaderView = customSearchController.customSearchBar
        
        customSearchController.customDelegate = self
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        productControllers.fetchParseData { (products, error) -> Void in
            
            self.products = products!
            
            
            //            print(self.products[0].itemName)
            
            self.tblSearchResults.reloadData()
           
            
            
        }


        // Do any additional setup after loading the view.
        configureCustomSearchController()
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if shouldShowSearchResults {
//            return filteredArray.count
//        } else {
//            return dataArray.count
//        }
        return self.products.count

    }
    
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HomeViewTableViewCell
          
        cell.Product_Name.text = self.products[indexPath.row].itemName
        
        
        
        cell.Product_RetailPrice.text = self.products[indexPath.row].retailPrice
        cell.Product_DiscountPrice.text = self.products[indexPath.row].discountPrice

        
       
//        if productControllers.itemImages.count > 0 {
//        cell.ProductImage.image = productControllers.itemImages[0]
//        } else {
//            print("Image was not loaded")
//        }
        
//        if shouldShowSearchResults {
//            cell.textLabel?.text = filteredArray[indexPath.row]
//        } else {
//            cell.textLabel?.text = dataArray[indexPath.row]
//        }
//
        
        return cell
    }


    
    
    func didStartSearching() {
        shouldShowSearchResults = true
        tblSearchResults.reloadData()
    }
    
    func didTapOnSearchButton() {
        if !shouldShowSearchResults {
            shouldShowSearchResults = true
            tblSearchResults.reloadData()
        }
    }
    
    func didTapOnCancellButton() {
        shouldShowSearchResults = false
        tblSearchResults.reloadData()
    }
    
    func didChangeSearchText(searchText: String) {
        filteredArray = dataArray.filter({ (product) -> Bool in
            let productText : NSString = product
            
            return (productText.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch).location) != NSNotFound
        })
        
        tblSearchResults.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        
    }
    
}
