//
//  HistoryTableViewController.swift
//  Home Test 4
//
//  Created by Alexander Besson on 2015-10-19.
//  Copyright © 2015 Alexander Besson. All rights reserved.
//

import UIKit

class HistoryTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = self.view.bounds.height / 5

        self.navigationController?.navigationBar.translucent = false
        self.navigationController?.navigationBar.barTintColor = CustomColors.getNavBarColor()
        self.navigationController?.navigationBar.backgroundColor = CustomColors.getNavBarColor()
        
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
        let cell = tableView.dequeueReusableCellWithIdentifier("HistoryCell", forIndexPath: indexPath) as! HomeViewTableViewCell

        let instanceOfCustomCell = HomeViewTableViewCell()
        let imageViewWidth = cell.bounds.height - 10
        //        let pBarWidth = cell.bounds.width / 3
        let stackWidth = cell.bounds.width / 3
        let stackHeight = cell.bounds.height - 50
        
        let cellHeight = cell.bounds.height
        //        let halfOfCellHeight = cell.bounds.height / 2
        let thirdOfCellHeight = cell.bounds.height / 3
        let tenthOfCellHeight = cell.bounds.height / 10
        
        let pBarWidth = (cell.bounds.width + cellHeight) / 3
        
        
        
        cell.lblTitle.text = instanceOfCustomCell.setLabelText()
        cell.lblTitle.frame = CGRectMake(0, 0, 130, 18)
        
        cell.lblDiscountPrice.text = "discount price"
        cell.lblDiscountPrice.frame = CGRectMake(0, 26, 130, 18)
        
        cell.lblRetailPrice.text = "retail price"
        cell.lblRetailPrice.frame = CGRectMake(0, 54, 160, 17)
        
        cell.imgProductImage.frame = CGRectMake(5, 5, cell.bounds.height - 10, cell.bounds.height - 10)
        cell.imgProductImage.image = UIImage(named: "SignIn.jpg")
        
        cell.pBarCommits.progressTintColor = UIColor.greenColor()
        cell.pBarCommits.trackTintColor = UIColor.redColor()
        
        cell.pBarCommits.frame = CGRectMake(imageViewWidth + 10 + (cell.bounds.width - imageViewWidth - 10) / 2 - pBarWidth / 2, cellHeight - tenthOfCellHeight, pBarWidth, 10)
        
        cell.pBarCommits.transform = CGAffineTransformScale(cell.pBarCommits.transform, 1, 5)
        
        cell.stkLabelStack.frame = CGRectMake(imageViewWidth + 10 + (cell.bounds.width - imageViewWidth - 10) / 2 - stackWidth / 2 - thirdOfCellHeight, tenthOfCellHeight, stackWidth + thirdOfCellHeight, stackHeight)

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

}
