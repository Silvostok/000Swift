//
//  FirstViewController.swift
//  Restaurants4Square
//
//  Created by Miguel Angel Rubio Caballero on 28/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import ObjectMapper

class ListViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  var restaurants = [Restaurant]()
  
  //MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.delegate = self
    tableView.dataSource = self
    retrieveFoursquare()
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! MapViewController
    
    controller.restaurants = restaurants
    
  }
  
  
  
  
  
  //MARK: FoursquareService Request
  func retrieveFoursquare() {
    let foursquareService = FoursquareService()
    
    foursquareService.getFoursquare {
      (let response) in
      //print(response)
      
      if let currrently = response {
        dispatch_async(dispatch_get_main_queue()) {
          
          self.restaurants = currrently
          self.tableView.reloadData()
          
        }
      }
    }
  }
  
}

//MARK: DataSource

extension ListViewController: UITableViewDataSource{
  
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return restaurants.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
    cell.textLabel?.text = restaurants[indexPath.row].name
    cell.detailTextLabel?.text = restaurants[indexPath.row].address
    return cell
  }
  
}

//MARK: Table delegate

extension ListViewController: UITableViewDelegate {
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  
}

