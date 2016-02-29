//
//  CityCell.swift
//  CollectionView
//
//  Created by Miguel Angel Rubio Caballero on 29/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class CityCell: UICollectionViewCell {
  
  
  @IBOutlet weak var cityImageView: UIImageView!
  
  @IBOutlet weak var gradientView: UIView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  var city: City? {
    didSet {
      if let city = city {
        cityImageView.image = UIImage(named: city.imageName)
        nameLabel.text = city.name
      }
    }
  }
  
}
