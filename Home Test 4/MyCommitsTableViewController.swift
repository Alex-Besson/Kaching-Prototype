//
//  MyCommitsTableViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-19.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class MyCommitsTableViewController: UITableViewController {
    
//    var itemsToPass : [Parse_ProductModel] = [specificItem]
//    var specificItem : Parse_ProductModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        
//        tableView.registerNib(UINib(nibName: "HomeViewTableViewCell", bundle:nil), forCellReuseIdentifier: "MyCommitCell")
        self.tableView.rowHeight = 128
        
        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = CustomColors.getNavBarColor()
        self.navigationController?.navigationBar.backgroundColor = CustomColors.getNavBarColor()
        
//        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName: UIFont(name: "Helvetica Neue", size: 10)!]
//        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: CustomColors.getButtonColor()]
        
        
        let startPoint = CGPointMake(0.0, (navigationController?.navigationBar.bounds.height)!)
        let endPoint = CGPointMake((navigationController?.navigationBar.bounds.width)!, ((navigationController?.navigationBar.bounds.height)!))
        let path = UIBezierPath()
        path.moveToPoint(startPoint)
        path.addLineToPoint(endPoint)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.CGPath
        shapeLayer.strokeColor = CustomColors.getButtonColor().CGColor
        shapeLayer.lineWidth = 3
        
        navigationController?.navigationBar.layer.addSublayer(shapeLayer)

    }
    
    let myCell = HomeViewTableViewCell()
//    let lblTitle = UILabel()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCommitsCell", forIndexPath: indexPath) as! HomeViewTableViewCell
        
        
        
        let instanceOfCustomCell = HomeViewTableViewCell()
        
        cell.lblTitle.text = instanceOfCustomCell.setLabelText()
        
        cell.lblTitle.frame = CGRectMake(0, 0, 130, 18)
        
        cell.lblDiscountPrice.text = "12 dorra"
        cell.lblDiscountPrice.frame = CGRectMake(0, 26, 130, 18)
        
        cell.lblRetailPrice.text = "16 dorra u buy now!"
        cell.lblRetailPrice.frame = CGRectMake(0, 54, 160, 17)
        
        cell.imgProductImage.frame = CGRectMake(10, 10, 130, 108)
        cell.imgProductImage.image = UIImage(named: "SignIn.jpg")
        
        cell.pBarCommits.progressTintColor = UIColor.greenColor()
        cell.pBarCommits.trackTintColor = UIColor.redColor()
        cell.pBarCommits.frame = CGRectMake(cell.bounds.width - 148, cell.bounds.height - 28, 118, 10)
        
        
        
//        self.specificItem?.currentCommit = 10
//        self.specificItem?.itemId = cell.lblTitle.text
//        self.specificItem?.itemDescription = "This is a description"
//        self.specificItem?.itemImageURL = "http://www.gettyimages.ca/gi-resources/images/Homepage/Category-Creative/UK/UK_Creative_462809583.jpg"
//        self.specificItem?.retailPrice = cell.lblRetailPrice.text
//        self.specificItem?.discountPrice = cell.lblDiscountPrice.text
//        
//        
        
//        itemsToPass.append(self.specificItem!)
        
        
        // DO NOT USE IBOUTLETS
//        cell.Product_Name.text = "Title"
//        cell.Product_RetailPrice.text = "Retail Price"
//        cell.Product_DiscountPrice.text = "Discount Price"
//        cell.ProductImage.image = UIImage(named: "SignIn")

        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "toDetailFromMyCommits" {
//            if let  detailViewController = segue.destinationViewController as? TemporaryDetailViewController{
//                if let indexPath = self.tableView.indexPathForCell(sender as! HomeViewTableViewCell) {
//                    
//                    detailViewController.product = itemsToPass[indexPath.row]
////                        self.products[indexPath.row]
//                    
//                }
//                
//            }
//        }
//    }


}
