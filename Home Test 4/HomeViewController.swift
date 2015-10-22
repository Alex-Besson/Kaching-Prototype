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

    
    lazy var refreshControl : UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh", forControlEvents: UIControlEvents.ValueChanged)
       
        
        return refreshControl
    }()
    
    func refresh(){
        loadData()
        refreshControl.endRefreshing()
        print("refresh complete")
    }
    
    
    

    @IBOutlet weak var tblSearchResults: UITableView!
    
    var customSearchController: CustomSearchController!
    
  
    
    func configureCustomSearchController() {
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, self.view.frame.size.width, 50.0), searchBarFont: UIFont(name: "Helvetica Neue", size: 16.0)!, searchBarTextColor: CustomColors.getTitleTextColor(), searchBarTintColor: UIColor.clearColor())
        
        
        customSearchController.customSearchBar.placeholder = "Search here..."
//        tblSearchResults.tableHeaderView = customSearchController.customSearchBar
       
        customSearchController.customDelegate = self
        
        
    }

    
    func loadData() {
        productControllers.fetchParseData { (products, error) -> Void in
            
            self.products = products!
         
            self.tblSearchResults.reloadData()
            
        }
    }
  
  // VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(navigationController?.navigationBar.frame.size.height)
        loadData()
        
        self.tblSearchResults.addSubview(self.refreshControl)
        tblSearchResults.rowHeight = 126
        
//        configureCustomSearchController()
        tblSearchResults.separatorColor = CustomColors.getTitleTextColor()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        configureCustomSearchController()
        self.navigationController?.navigationBar.topItem?.titleView = customSearchController.customSearchBar
        
    }
    
    // TABLE VIEW FUNCTIONS
    
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
     
        
        cell.Product_RetailPrice.text = "Was: $\(product.retailPrice!)"
        cell.Product_DiscountPrice.text = "Now: $\(product.discountPrice!)"
    
    
        
        
        cell.Product_ProgressBar.ChangeProgressBar(product.currentCommit!, threshold: product.threshold!)
        
            cell.ProductImage.imageFromUrl(product.itemImageURL!)
        
       
        return cell
    }


    
    // SEARCH BAR FUNCTIONS
    
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
        if let  detailViewController = segue.destinationViewController as? TemporaryDetailViewController{
                 if let indexPath = self.tblSearchResults.indexPathForCell(sender as! HomeViewTableViewCell) {

            detailViewController.product = (shouldShowSearchResults) ? filteredArray[indexPath.row] :
                self.products[indexPath.row]
                   
            }
            
        }
        }
    }
    
}
