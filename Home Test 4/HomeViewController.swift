//
//  HomeViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-01.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

var shouldShowSearchResults = false

var products = [Parse_ProductModel]()

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, CustomSearchControllerDelegate {
    var filteredArray = [Parse_ProductModel]()
    
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
        customSearchController = CustomSearchController(searchResultsController: self, searchBarFrame: CGRectMake(0.0, 0.0, self.view.frame.size.width, 50.0), searchBarFont: UIFont(name: "Helvetica Neue", size: 16.0)!, searchBarTextColor: CustomColors.getButtonColor(), searchBarTintColor: CustomColors.getNavBarColor())
        
        customSearchController.customSearchBar.backgroundColor = UIColor.clearColor()
        customSearchController.customSearchBar.placeholder = "Search here..."
        
//        customSearchController.customSearchBar.setPositionAdjustment(UIOffsetMake(0, 0), forSearchBarIcon: .Search)
//        tblSearchResults.tableHeaderView = customSearchController.customSearchBar
//        customSearchController.customSearchBar.setScopeBarButtonTitleTextAttributes(["Search" : "lol"], forState: UIControlState.Normal)
//        customSearchController.customSearchBar.
        
        customSearchController.customDelegate = self
//        customSearchController.customSearchBar.showsCancelButton = false
        
        
        
        
    }

    
    func loadData() {
        productControllers.fetchParseData { (productz, error) -> Void in
            
            products = productz!
         
            self.tblSearchResults.reloadData()
            
        }
    }
  
  // VIEW DID LOAD
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(navigationController?.navigationBar.frame.size.height)
        loadData()
        
        self.tblSearchResults.addSubview(self.refreshControl)
        tblSearchResults.rowHeight = 128
        tblSearchResults.backgroundColor = CustomColors.getViewBackgroundColor()
        
//        configureCustomSearchController()
        tblSearchResults.separatorColor = CustomColors.getTitleTextColor()
        
        configureCustomSearchController()
        
        // // //
        
        let textfield:UITextField = customSearchController.customSearchBar.valueForKey("searchField") as! UITextField
        
        //Set the foregroundcolor of the placeholder
        let attributedString = NSAttributedString(string: "Search...", attributes: [NSForegroundColorAttributeName : CustomColors.getButtonColor()])
        
        textfield.attributedPlaceholder = attributedString

        //Get the glass icon
        let iconView:UIImageView = textfield.leftView as! UIImageView
        //Make the icon to a template which you can edit
        iconView.image = iconView.image?.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        //Set the color of the icon
        iconView.tintColor = CustomColors.getButtonColor()
//        customSearchControll
        
    }
    
    // VIEW DID APPEAR
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.topItem?.titleView = customSearchController.customSearchBar
        
    }
    
    // TABLE VIEW FUNCTIONS
    
    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if shouldShowSearchResults {
            
            return filteredArray.count
            
        } else {
           
            return products.count
            
        }


    }
    
    
    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! HomeViewTableViewCell
        
        let product = (!shouldShowSearchResults) ? products[indexPath.row] :
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
        filteredArray = products.filter({ (product) -> Bool in
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
                products[indexPath.row]
                   
            }
            
        }
        }
    }
    
}
