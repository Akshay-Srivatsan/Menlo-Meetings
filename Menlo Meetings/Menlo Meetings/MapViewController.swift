//
//  MapViewController.swift
//  Menlo Meetings
//
//  Created by Aaron Brown on 5/24/15.
//  Copyright (c) 2015 Akshay Srivatsan. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UISearchBarDelegate, UITableViewDataSource,
UIPopoverPresentationControllerDelegate, MKMapViewDelegate {
    
    //Information Feature
    var contentController:UITableViewController!
    var tableMapOptions:UITableView!
    var mapType:UISegmentedControl!
    var showPointsOfInterest:UISwitch!
    //Variable for PinDetailsViewController
    var mapItemData:MKMapItem!
   
    @IBOutlet var showOptionsBtn: UIBarButtonItem!
    @IBAction func showMapOptions(sender: AnyObject) {
        //1 Presenting in a Popover style
        contentController.modalPresentationStyle = UIModalPresentationStyle.Popover
        //2
        var popPC:UIPopoverPresentationController = contentController.popoverPresentationController!
        var barButtonItem:UIBarButtonItem = UIBarButtonItem()
        popPC.barButtonItem = showOptionsBtn
        popPC.permittedArrowDirections = UIPopoverArrowDirection.Any
        popPC.delegate = self
        presentViewController(contentController, animated: true, completion: nil)
    }
    
    //Map with Search Controller
    var searchController:UISearchController!
    var annotation:MKAnnotation!
    var localSearchRequest:MKLocalSearchRequest!
    var localSearch:MKLocalSearch!
    var localSearchResponse:MKLocalSearchResponse!
    var error:NSError!
    var pointAnnotation:MKPointAnnotation!
    var pinAnnotationView:MKPinAnnotationView!
    
    @IBOutlet var mapView: MKMapView!
    @IBAction func showSearchBar(sender: AnyObject) {
        searchController = UISearchController(searchResultsController: nil)
        searchController.hidesNavigationBarDuringPresentation = false
        self.searchController.searchBar.delegate = self
        presentViewController(searchController, animated: true, completion: nil)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar){
        //1
        searchBar.resignFirstResponder()
        dismissViewControllerAnimated(true, completion: nil)
        if self.mapView.annotations.count != 0{
            annotation = self.mapView.annotations[0] as! MKAnnotation
            self.mapView.removeAnnotation(annotation)
        }
        //2
        localSearchRequest = MKLocalSearchRequest()
        localSearchRequest.naturalLanguageQuery = searchBar.text
        localSearch = MKLocalSearch(request: localSearchRequest)
        localSearch.startWithCompletionHandler { (localSearchResponse, error) -> Void in
            
            if localSearchResponse == nil{
                var alert = UIAlertView(title: nil, message: "Place not found", delegate: self, cancelButtonTitle: "Try again")
                alert.show()
                return
            }
            //3
            self.pointAnnotation = MKPointAnnotation()
            self.pointAnnotation.title = searchBar.text
            self.pointAnnotation.coordinate = CLLocationCoordinate2D(latitude: localSearchResponse.boundingRegion.center.latitude, longitude:     localSearchResponse.boundingRegion.center.longitude)
            
            
            self.pinAnnotationView = MKPinAnnotationView(annotation: self.pointAnnotation, reuseIdentifier: nil)
            self.mapView.centerCoordinate = self.pointAnnotation.coordinate
            self.mapView.addAnnotation(self.pinAnnotationView.annotation)
            self.mapItemData = localSearchResponse.mapItems.last as! MKMapItem
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableMapOptions = UITableView()
        tableMapOptions.dataSource = self
        contentController = UITableViewController()
        contentController.tableView = tableMapOptions
        mapView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
            
            var cell:UITableViewCell! = tableView.dequeueReusableCellWithIdentifier("cellIdentifier")as? UITableViewCell
            if cell == nil{
                cell = UITableViewCell(style: UITableViewCellStyle.Value1, reuseIdentifier: "cellIdentifier")
                if indexPath.row == 0{
                    mapType = UISegmentedControl(items: ["Standard","Satellite","Hybrid"])
                    mapType.center = cell.center
                    cell.addSubview(mapType)
                }
                if indexPath.row == 1{
                    showPointsOfInterest = UISwitch()
                    cell.textLabel?.text = "Show Points Of Interest"
                    cell.accessoryView = showPointsOfInterest
                }
            }
            return cell
    }
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int{
            return 2
    }
    
    //1
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle
    {
        return .FullScreen
    }
    //2
    func presentationController(controller: UIPresentationController,
        viewControllerForAdaptivePresentationStyle style: UIModalPresentationStyle) -> UIViewController?{
            
            var navController:UINavigationController = UINavigationController(rootViewController: controller.presentedViewController)
            controller.presentedViewController.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action:"done")
            return navController
    }
    
    func done (){
        presentedViewController?.dismissViewControllerAnimated(true, completion: nil)
        
        if showPointsOfInterest.on{
            mapView.showsPointsOfInterest = true
        }else{
            mapView.showsPointsOfInterest = false
        }
        if mapType.selectedSegmentIndex == 0{
            mapView.mapType = MKMapType.Standard
        }else if mapType.selectedSegmentIndex == 1{
            mapView.mapType = MKMapType.Satellite
        }else if mapType.selectedSegmentIndex == 2{
            mapView.mapType = MKMapType.Hybrid
        }
    }
    
    func popoverPresentationControllerDidDismissPopover(popoverPresentationController: UIPopoverPresentationController){
        done()
    }
    
    func mapView(mapView: MKMapView!,
        viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView!{
            self.pinAnnotationView.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.InfoLight) as! UIButton
            self.pinAnnotationView.canShowCallout = true
            return self.pinAnnotationView
    }
    
    func mapView(mapView: MKMapView!,
        annotationView view: MKAnnotationView!,
        calloutAccessoryControlTapped control: UIControl!){
            self.performSegueWithIdentifier("PinDetails", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue,
        sender: AnyObject?){
            var pinDetailsVC = PinDetailsViewController()
            pinDetailsVC = segue.destinationViewController as! PinDetailsViewController
            pinDetailsVC.mapItemData = self.mapItemData
    }
    
    
        
}

