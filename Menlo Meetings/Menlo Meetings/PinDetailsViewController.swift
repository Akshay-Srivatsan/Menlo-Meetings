//
//  PinDetailsViewController.swift
//  Menlo Meetings
//
//  Created by Aaron Brown on 5/26/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import UIKit
import MapKit

class PinDetailsViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableView: UITableView!
    
    var mapItemData:MKMapItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        //set the datasource to self
        tableView.dataSource = self
    }
    

    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")as? UITableViewCell
            if cell == nil{
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellIdentifier")
                if indexPath.row == 0{
                    cell.textLabel?.text = mapItemData.name
                }
                if indexPath.row == 1{
                    cell.textLabel?.text = mapItemData.placemark.country
                    cell.detailTextLabel?.text = mapItemData.placemark.countryCode
                }
                if indexPath.row == 2{
                    cell.textLabel?.text = mapItemData.placemark.postalCode
                }
                if indexPath.row == 3{
                    cell.textLabel?.text = "Phone number"
                    cell.detailTextLabel?.text = mapItemData.phoneNumber
                }
            }
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return 4
        }
    
    }
