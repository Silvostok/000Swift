//
//  ViewController.swift
//  Segue
//
//  Created by Miguel Angel Rubio Caballero on 18/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  let datasource = Datasource()
  var lastSelectedCity: City?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    let controller = (segue.destinationViewController as! UINavigationController).topViewController as! DetailViewController
    
    controller.city = lastSelectedCity!
    
  }
  
  
  func showCity(id: String) {
    
    lastSelectedCity = datasource.cityFromID(id)
    performSegueWithIdentifier("showCity", sender: self)
    
  }
  
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return datasource.cities.count
    
  }
  
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell")
    
    let city = datasource.cities[indexPath.row]
    cell?.textLabel?.text = city.name
    
    return cell!
  }
  
  func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
    let selectedIndex = tableView.indexPathForSelectedRow?.row
    lastSelectedCity = datasource.cities[selectedIndex!]
    
    performSegueWithIdentifier("showCity", sender: self)
    
  }
  
  
  
}

