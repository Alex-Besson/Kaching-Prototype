//
//  HomeViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit





var shouldShowSearchResults = false



class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, CustomSearchControllerDelegate {
    var filteredArray = [Parse_ProductModel]()
    var products = [Parse_ProductModel]()
    let productControllers = ProductController()
    var Pbar = [Float]()
    var PFFiles = [PFFile]()
    var myImages = [UIImage]()

    @IBOutlet weak var tblSearchResults: UITableView!
    
    var customSearchController: CustomSearchController!
    
    func convertPFFilesToUIImage() -> Bool {
       
        
        
        for PFFilez in PFFiles {
        PFFilez.getDataInBackgroundWithBlock {
            (imageData: NSData?, error: NSError?) -> Void in
            if error == nil {
                let eventImage = UIImage(data:imageData!)
               
                
                
                self.myImages.append(eventImage!)
            }
                
            }
        }
     return true
    }
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, tblSearchResults.frame.size.width, 50.0), searchBarFont: UIFont(name: "Futura", size: 16.0)!, searchBarTextColor: UIColor.purpleColor(), searchBarTintColor: UIColor.blackColor())
        
        customSearchController.customSearchBar.placeholder = "Search here..."
        tblSearchResults.tableHeaderView = customSearchController.customSearchBar
        
        customSearchController.customDelegate = self
    }

    func CalculateProgressBar (currentCommit:Float,currentThreshold:Float) -> Float{
        
        return (currentCommit/currentThreshold)
        
        
    }
    
    
    
    var refresh = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        productControllers.fetchParseData { (products,itemImages, error) -> Void in
            
            self.products = products!
            
            guard let itemImage = itemImages else {
                return
                
            }
            
            
            
            
            self.PFFiles += itemImage
            self.convertPFFilesToUIImage()
            self.tblSearchResults.reloadData()
     
            
            
        }
        

        
        

        // Do any additional setup after loading the view.
        configureCustomSearchController()
    }
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            
            return filteredArray.count
            
        } else {
           
            return self.products.count
            
        }


    }
    
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HomeViewTableViewCell
        
        let product = (!shouldShowSearchResults) ? self.products[indexPath.row] :
            self.filteredArray[indexPath.row]
        
        
        cell.Product_Name.text = product.itemName
        
        
        
        cell.Product_RetailPrice.text = product.retailPrice
        cell.Product_DiscountPrice.text = product.discountPrice
        
        
        
        
        Pbar.append(CalculateProgressBar(product.currentCommit!, currentThreshold: product.threshold!))
        
        cell.Product_ProgressBar.setProgress(Pbar[indexPath.row], animated: true)

//
//            dispatch_async(dispatch_get_main_queue()) { () -> Void in
//                if self.convertPFFilesToUIImage() == true {
//                    cell.ProductImage.image = self.myImages[indexPath.row]
//                }
//            }
//
//        }
        

        
        
        
        
    
        
        print(self.myImages.count)
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
    
    // SEARCH DELEGATE FUNCTION
    
    func didChangeSearchText(searchText: String) {
        filteredArray = self.products.filter({ (product) -> Bool in
            let productText = product.itemName?.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            
            return productText != nil
        })
        
        tblSearchResults.reloadData()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "detailView" {
        if let  detailViewController = segue.destinationViewController as? ProductDetailViewController{
        
        if let indexPath = self.tblSearchResults.indexPathForCell(sender as! HomeViewTableViewCell) {
            detailViewController.itemRetailPrice = self.products[indexPath.row].retailPrice
            detailViewController.itemDiscountPrice = self.products[indexPath.row].discountPrice
            detailViewController.itemImage = self.myImages[indexPath.row]
            detailViewController.currentItemCommit = self.products[indexPath.row].currentCommit
            detailViewController.currentItemThreshold = self.products[indexPath.row].threshold
            detailViewController.currentItemID = self.products[indexPath.row].itemId
            }
        }
        }
    }
    
}
