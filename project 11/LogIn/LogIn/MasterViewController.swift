//
//  MasterViewController.swift
//  LogIn
//
//  Created by Miguel Angel Rubio Caballero on 07/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import CoreData

class MasterViewController: UIViewController {
  
  
  @IBOutlet weak var tableView: UITableView!
  
  
  var isAuthenticated = false
  
  var managedObjectContext: NSManagedObjectContext? = nil
  var _fetchedResultsController: NSFetchedResultsController? = nil
  
  var didReturnFromBackground = false
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
  }
  
  

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem()
    
    view.alpha = 0
    
    let addButton = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: "insertNewObject:")
    self.navigationItem.rightBarButtonItem = addButton
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "appWillResignActive:", name: UIApplicationWillResignActiveNotification, object: nil)
    
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "appDidBecomeActive:", name: UIApplicationDidBecomeActiveNotification, object: nil)
  }
  
  
  
  @IBAction func unwindSegue(segue: UIStoryboardSegue) {
    isAuthenticated = true
    view.alpha = 1.0
  }
  
  
  
  
  func appWillResignActive(notification : NSNotification) {
    
    view.alpha = 0
    isAuthenticated = false
    didReturnFromBackground = true
  }
  
  func appDidBecomeActive(notification : NSNotification) {
    
    if didReturnFromBackground {
      self.showLoginView()
    }
  }
  
  
  override func viewDidAppear(animated: Bool) {
    
    super.viewDidAppear(false)
    self.showLoginView()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  func showLoginView() {
    
    if !isAuthenticated {
      
      self.performSegueWithIdentifier("loginView", sender: self)
    }
  }
  
  func insertNewObject(sender: AnyObject) {
    let context = self.fetchedResultsController.managedObjectContext
    let entity = self.fetchedResultsController.fetchRequest.entity!
    let newManagedObject = NSEntityDescription.insertNewObjectForEntityForName(entity.name!, inManagedObjectContext: context) as NSManagedObject
    
    newManagedObject.setValue(NSDate(), forKey: "date")
    newManagedObject.setValue("New Note", forKey: "noteText")
    
    do {
      try context.save()
    } catch let error1 as NSError {
      print("Error inserting data \(error1)")
      abort()
    }
  }
  
  // MARK: - Segues
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "showDetail" {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
        (segue.destinationViewController as! DetailViewController).detailItem = object
      }
    }
  }
  
  
  
  
  
  
  
  
  
  
  
  @IBAction func logoutAction(sender: AnyObject) {
    isAuthenticated = false
    self.performSegueWithIdentifier("loginView", sender: self)
  }

}



extension MasterViewController: UITableViewDataSource, UITableViewDelegate {
  
//  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//    return self.fetchedResultsController.sections?.count ?? 0
//  }
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let sectionInfo = self.fetchedResultsController.sections![section] as NSFetchedResultsSectionInfo
    return sectionInfo.numberOfObjects
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
    self.configureCell(cell, atIndexPath: indexPath)
    return cell
  }
  
  func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    
    return true
  }
  
  func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
      let context = self.fetchedResultsController.managedObjectContext
      context.deleteObject(self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject)
      
      do {
        try context.save()
      } catch let error1 as NSError {
        print("Error editing the table \(error1)")
        abort()
      }
    }
  }
  
  func configureCell(cell: UITableViewCell, atIndexPath indexPath: NSIndexPath) {
    let object = self.fetchedResultsController.objectAtIndexPath(indexPath) as! NSManagedObject
    cell.textLabel?.text = object.valueForKey("noteText")!.description
  }
}


extension MasterViewController: NSFetchedResultsControllerDelegate {
  
  var fetchedResultsController: NSFetchedResultsController {
    if _fetchedResultsController != nil {
      return _fetchedResultsController!
    }
    
    let fetchRequest = NSFetchRequest()
    
    let entity = NSEntityDescription.entityForName("Note", inManagedObjectContext: self.managedObjectContext!)
    fetchRequest.entity = entity
    
    fetchRequest.fetchBatchSize = 20
    
    let sortDescriptor = NSSortDescriptor(key: "date", ascending: false)
    //let sortDescriptors = [sortDescriptor]
    
    fetchRequest.sortDescriptors = [sortDescriptor]
    
    let aFetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.managedObjectContext!, sectionNameKeyPath: nil, cacheName: "Sabores")
    aFetchedResultsController.delegate = self
    _fetchedResultsController = aFetchedResultsController
    
    do {
      try _fetchedResultsController!.performFetch()
    } catch let error1 as NSError {
      print("Error fetching data \(error1)")
      
      abort()
    }
    
    return _fetchedResultsController!
  }
  
  
  func controller(controller: NSFetchedResultsController, didChangeSection sectionInfo: NSFetchedResultsSectionInfo, atIndex sectionIndex: Int, forChangeType type: NSFetchedResultsChangeType) {
    switch type {
    case .Insert:
      self.tableView.insertSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
    case .Delete:
      self.tableView.deleteSections(NSIndexSet(index: sectionIndex), withRowAnimation: .Fade)
    default:
      return
    }
  }
  
  func controller(controller: NSFetchedResultsController, didChangeObject anObject: AnyObject, atIndexPath indexPath: NSIndexPath?, forChangeType type: NSFetchedResultsChangeType, newIndexPath: NSIndexPath?) {
    switch type {
    case .Insert:
      tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
    case .Delete:
      tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
    case .Update:
      self.configureCell(tableView.cellForRowAtIndexPath(indexPath!)!, atIndexPath: indexPath!)
    case .Move:
      tableView.deleteRowsAtIndexPaths([indexPath!], withRowAnimation: .Fade)
      tableView.insertRowsAtIndexPaths([newIndexPath!], withRowAnimation: .Fade)
    }
  }
 
  
  
}