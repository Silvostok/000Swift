//
//  Icon.swift
//  TableDeleteRow
//
//  Created by Miguel Angel Rubio Caballero on 18/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit


class Icon {
  
  var title: String
  var subtitle: String
  var image: UIImage?
  
  init(title: String, subtitle: String, imageName: String?) {
    self.title = title
    self.subtitle = subtitle
    if let imageName = imageName {
      if let iconImage = UIImage(named: imageName) {
        image = iconImage
      }
    }
    
  }
}


