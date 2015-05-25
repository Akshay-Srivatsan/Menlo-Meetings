//
//  SubscriptionTableViewController.swift
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/29/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import UIKit

class SubscriptionTableViewController: UITableViewController {
    var subscriptions = [String]();
    //We should insert the Detail Label Outlet Here
    var details = [String]();
    
    override func viewDidLoad() {
        super.viewDidLoad();
        loadInstance();
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "enteredBackground:", name: UIApplicationDidEnterBackgroundNotification, object: nil);
    }
    
    func enteredBackground(sender: AnyObject) {
        save();
    }
    
    
    override func viewWillDisappear(animated: Bool) {
        save();
    }
    
    override func numberOfSectionsInTableView(tableView : UITableView) -> Int {
        return 1;
        
    }
    
    override func tableView(tableView : UITableView, numberOfRowsInSection section : Int) -> Int {
        return subscriptions.count;
        
    }
    
    override func tableView(tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myTableCell", forIndexPath:indexPath) as! UITableViewCell;
        cell.textLabel!.text = subscriptions[indexPath.row];
        return cell;
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            self.subscriptions.removeAtIndex(indexPath.row);
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Fade)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var sstvc : SubscriptionSearchTableViewController = (segue.destinationViewController as! UINavigationController).visibleViewController as! SubscriptionSearchTableViewController;
        sstvc.subscribedTable = self;
    }
    
    func filePath() -> String {
        return NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true).first!.stringByAppendingPathComponent("subscriptions");
    }
    
    func loadInstance() {
        let decodedData = NSData(contentsOfFile: filePath());
        if let dd = decodedData
        {
            subscriptions = NSKeyedUnarchiver.unarchiveObjectWithData(dd) as! [String];
        }
    }
    
    @objc func save() {
        let encodedData = NSKeyedArchiver.archivedDataWithRootObject(subscriptions);
        encodedData.writeToFile(filePath(), atomically: true);
    }

}