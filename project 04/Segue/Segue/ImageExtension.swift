//
//  ImageExtension.swift
//  Segue
//
//  Created by Miguel Angel Rubio Caballero on 27/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit



extension UIImage {
  
  enum Asset: String {
    
    case Bilbao = "bilbao"
    case Caceres = "caceres"
    case Cadiz = "cadiz"
    case Sevilla = "sevilla"
    case Soria = "soria"
    case Valencia = "valencia"
    case Zamora = "zamora"
    
    var image: UIImage {
      return UIImage(named: self.rawValue)!
    }
    
  }
  
  convenience init!(asset: Asset) {
    self.init(named: asset.rawValue)
  }
  
  
  
}