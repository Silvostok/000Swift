//
//  AppDelegate.swift
//  LogIn
//
//  Created by Miguel Angel Rubio Caballero on 07/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    let NavigationController = self.window!.rootViewController as! UINavigationController
    let Controller = NavigationController.topViewController as! MasterViewController
    Controller.managedObjectContext = self.managedObjectContext
    
    self.prepareNavigationBarAppearance()
    
    return true
  }
  
  func prepareNavigationBarAppearance() {
    
    let BarColor = UIColor(red:43.0/255.0, green:43.0/255.0,blue:43.0/255.0,alpha:1.0)
    
    UINavigationBar.appearance().barTintColor = BarColor
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    
    let font = UIFont(name: "Helvetica", size: 30)!
    let regularVertical = UITraitCollection(verticalSizeClass:.Regular)
    let titleDict : Dictionary = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: font]
    
    UINavigationBar.appearanceForTraitCollection(regularVertical).titleTextAttributes = titleDict
    
    UIToolbar.appearance().barTintColor = BarColor
    UIToolbar.appearance().tintColor = UIColor.whiteColor()
    
    UIStatusBarStyle.LightContent
    
    
  }
  
  
  func applicationWillResignActive(application: UIApplication) {
    
    UIApplication.sharedApplication().ignoreSnapshotOnNextApplicationLaunch()
  }
  
  
  func applicationWillTerminate(application: UIApplication) {
    
    self.saveContext()
  }
  
  // MARK: - Core Data stack
  
  lazy var applicationDocumentsDirectory: NSURL = {
    
    let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
    return urls[urls.count-1] as NSURL
  }()
  
  lazy var managedObjectModel: NSManagedObjectModel = {
    
    let modelURL = NSBundle.mainBundle().URLForResource("LogIn", withExtension: "momd")!
    return NSManagedObjectModel(contentsOfURL: modelURL)!
  }()
  
  lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator? = {
    
    var coordinator: NSPersistentStoreCoordinator? = NSPersistentStoreCoordinator(managedObjectModel: self.managedObjectModel)
    let url = self.applicationDocumentsDirectory.URLByAppendingPathComponent("LogIn.sqlite")
    var error: NSError? = nil
    var failureReason = "There was an error creating or loading the application's saved data."
    do {
      try coordinator!.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: url, options: nil)
    } catch var error1 as NSError {
      error = error1
      coordinator = nil
      
      let dict = NSMutableDictionary()
      dict[NSLocalizedDescriptionKey] = "Failed to initialize the application's saved data"
      dict[NSLocalizedFailureReasonErrorKey] = failureReason
      dict[NSUnderlyingErrorKey] = error
      // error = NSError(domain: "YOUR_ERROR_DOMAIN", code: 9999, userInfo: dict)
      
      NSLog("Unresolved error \(error), \(error!.userInfo)")
      abort()
    } catch {
      fatalError()
    }
    
    return coordinator
  }()
  
  lazy var managedObjectContext: NSManagedObjectContext? = {
    
    let coordinator = self.persistentStoreCoordinator
    if coordinator == nil {
      return nil
    }
    var managedObjectContext = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
    managedObjectContext.persistentStoreCoordinator = coordinator
    return managedObjectContext
  }()
  
  // MARK: - Core Data Saving support
  
  func saveContext () {
    if let moc = self.managedObjectContext {
      var error: NSError? = nil
      if moc.hasChanges {
        do {
          try moc.save()
        } catch let error1 as NSError {
          error = error1
          
          NSLog("Unresolved error \(error), \(error!.userInfo)")
          abort()
        }
      }
    }
  }
  
}