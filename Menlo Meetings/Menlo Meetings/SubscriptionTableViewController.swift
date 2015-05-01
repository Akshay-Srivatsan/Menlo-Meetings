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
    
    override func viewDidLoad() {
        super.viewDidLoad();
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
        print("Test");
        return cell;
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var sstvc : SubscriptionSearchTableViewController = (segue.destinationViewController as! UINavigationController).visibleViewController as! SubscriptionSearchTableViewController;
        sstvc.subscribedTable = self;
    }

}
