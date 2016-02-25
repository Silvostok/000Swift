//
//  AppDelegate.swift
//  NSURLSession
//
//  Created by Miguel Angel Rubio Caballero on 25/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let tintColor =  UIColor(red: 155/255, green: 89/255, blue: 182/255, alpha: 1)


  func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
    
    customizeAppearance()
    return true
  }

  
  private func customizeAppearance() {
    window?.tintColor = tintColor
    UISearchBar.appearance().barTintColor = tintColor
    UINavigationBar.appearance().barTintColor = tintColor
    UINavigationBar.appearance().tintColor = UIColor.whiteColor()
    UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName:UIColor.whiteColor()]
  }

}

