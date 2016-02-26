//
//  DetailViewController.swift
//  Segue
//
//  Created by Miguel Angel Rubio Caballero on 26/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
  
  
  var city: City!
  
  
  @IBOutlet weak var regionLabel: UILabel!
  @IBOutlet weak var cityLabel: UILabel!
  @IBOutlet weak var cityImage: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    regionLabel.text = city.regio
    cityLabel.text = city.name
    cityImage.image = city.image
    
    
    

  }

  @IBAction func backButtonPressed(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  

}
