//
//  SupscriptionTableViewController.swift
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/29/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import UIKit

class SupscriptionTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad();
    }
    
    override func numberOfSectionsInTableView(tableView : UITableView) -> Int {
        return 1;
        
    }
    
    override func tableView(tableView : UITableView, numberOfRowsInSection section : Int) -> Int {
        return 1;
        
    }
    
    override func tableView(tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("myTableCell", forIndexPath:indexPath) as! UITableViewCell;
        cell.textLabel!.text = "Hello";
        print("Test");
        return cell;
    }

}
