//
//  AppAppearance.swift
//  Restaurants4Square
//
//  Created by Miguel Angel Rubio Caballero on 31/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

extension UIColor {
  
  static var flatBlue: UIColor {
    return UIColor(red: 0/255.0, green: 116/255.0, blue: 251/255.0, alpha: 1.0)
  }
  static var LightFlatBlue: UIColor {
    return UIColor(red: 178/255.0, green: 209/255.0, blue: 242/255.0, alpha: 1.0)
  }
  
}


func styleNavBar() {
  let appearanceProxy = UINavigationBar.appearance()
  appearanceProxy.barTintColor = UIColor.flatBlue
  appearanceProxy.tintColor = UIColor.LightFlatBlue
  let font = UIFont.systemFontOfSize(24, weight: UIFontWeightThin)
  
  appearanceProxy.titleTextAttributes = [
    NSForegroundColorAttributeName : UIColor.LightFlatBlue,
    NSFontAttributeName            : font]
}

