//
//  SubscriptionSearchTableViewController.swift
//  Menlo Meetings
//
//  Created by Akshay Srivatsan on 4/29/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import UIKit

class SubscriptionSearchTableViewController: UITableViewController, UISearchBarDelegate, UISearchControllerDelegate, UISearchResultsUpdating {
    
    var subscriptions = ["Genius Bar", "The Neighborhood", "Trivia Club"];
    var filteredSubscriptions = [];
    var searchController : UISearchController?;
    
    override func viewDidLoad() {
        searchController = UISearchController(searchResultsController: nil);
        searchController!.searchResultsUpdater = self;
        searchController!.dimsBackgroundDuringPresentation = false;
        searchController!.searchBar.delegate = self;
        searchController!.searchBar.sizeToFit();
        tableView.tableHeaderView = self.searchController!.searchBar;
        self.definesPresentationContext = true;
        subscriptions.append(searchController!.searchBar.text);
        tableView.reloadData();
        super.viewDidLoad();

    }
    
    override func numberOfSectionsInTableView(tableView : UITableView) -> Int {
        return 1;
        
    }
    
    override func tableView(tableView : UITableView, numberOfRowsInSection section : Int) -> Int {
        println("Hello");
        println(searchController!.active);
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
            cell.textLabel!.text = subscriptions[indexPath.row];
        }
        else
        {
            cell.textLabel!.text = filteredSubscriptions[indexPath.row] as? String;
        }
        
        return cell;
    }
    
    func updateSearchResultsForSearchController(searchController : UISearchController)
    {
        subscriptions.removeAll(keepCapacity: false);
        var pred = NSPredicate(format: "self contains %@", searchController.searchBar.text);
        var array = (subscriptions as NSArray).filteredArrayUsingPredicate(pred);
        filteredSubscriptions = array as! [String];
        tableView.reloadData();
        println(searchController.searchBar.text);
    }

}
