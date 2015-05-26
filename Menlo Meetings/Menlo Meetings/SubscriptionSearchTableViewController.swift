//
//  SubscriptionSearchTableViewController.swift
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/29/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import UIKit

class SubscriptionSearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    var subscriptions = [
        Subscription(name: "Genius Bar", teacher: "Ms. Miller"),
        Subscription(name: "The Neighborhood", teacher: "Mr. Thibodeaux"),
        Subscription(name: "Trivia Club", teacher: "Mr. Steinberg"),
        Subscription(name: "Junior Classical League", teacher: "Mag. Vasquez"),
        Subscription(name: "Mock Trial", teacher: "Mr. Devitt")
    ];
    var filteredSubscriptions = [Subscription]();
    var searchController : UISearchController?;
    var subscribedTable : SubscriptionTableViewController?;
    
    override func viewDidLoad() {
        searchController = UISearchController(searchResultsController: nil);
        searchController!.searchResultsUpdater = self;
        searchController!.dimsBackgroundDuringPresentation = false;
        searchController!.searchBar.delegate = self;
        searchController!.searchBar.sizeToFit();
        tableView.tableHeaderView = self.searchController!.searchBar;
        self.definesPresentationContext = true;
        let arr : [Subscription]! = subscribedTable?.subscriptions;
        for sub in arr
        {
            subscriptions.removeAtIndex(find(subscriptions, sub)!);
        }
        tableView.reloadData();
        super.viewDidLoad();

    }
    
    override func numberOfSectionsInTableView(tableView : UITableView) -> Int {
        return 1;
        
    }
    
    override func tableView(tableView : UITableView, numberOfRowsInSection section : Int) -> Int {
        if (!searchController!.active)
        {
            return subscriptions.count;
        }
        else
        {
            return filteredSubscriptions.count;
        }
    }
    
    override func tableView(tableView : UITableView, cellForRowAtIndexPath indexPath : NSIndexPath) -> UITableViewCell {
        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier("searchTableCell", forIndexPath:indexPath) as! UITableViewCell;
        if (!searchController!.active)
        {
            cell.textLabel!.text = subscriptions[indexPath.row].name;
            cell.detailTextLabel!.text = subscriptions[indexPath.row].teacher;
        }
        else
        {
            cell.textLabel!.text = filteredSubscriptions[indexPath.row].name;
            cell.detailTextLabel!.text = filteredSubscriptions[indexPath.row].teacher;
        }
        
        return cell;
    }
    
    func updateSearchResultsForSearchController(searchController : UISearchController)
    {
        filteredSubscriptions.removeAll(keepCapacity: false);
        var pred = NSPredicate(format: "SELF.name contains[c] %@", searchController.searchBar.text);
        var array = (subscriptions as NSArray).filteredArrayUsingPredicate(pred);
        filteredSubscriptions = array as! [Subscription];
        tableView.reloadData();
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (!searchController!.active)
        {
            subscribedTable?.subscriptions.append(subscriptions[indexPath.row]);
        }
        else
        {
            subscribedTable?.subscriptions.append(filteredSubscriptions[indexPath.row]);
        }
        subscribedTable?.tableView.reloadData();
        self.dismissViewControllerAnimated(true, completion: nil);
        self.dismissViewControllerAnimated(true, completion: nil);
    }

    @IBAction func cancel(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil);
    }
}
