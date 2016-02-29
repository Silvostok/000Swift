//
//  DetailViewController.swift
//  CollectionView
//
//  Created by Miguel Angel Rubio Caballero on 29/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  var city: City?
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    if let city = city {
      navigationItem.title = city.name
      imageView.image = UIImage(named: city.imageName)
    }
    
  }
  
}
