//
//  ArtWork.swift
//  AdamPublicArt
//
//  Created by Miguel Angel Rubio Caballero on 06/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import Foundation
import MapKit


class Artwork: NSObject, MKAnnotation {
  
  let title: String?
  let locationName: String
  let discipline: String
  let coordinate: CLLocationCoordinate2D
  
  init(title: String, locationName: String, discipline: String, coordinate: CLLocationCoordinate2D) {
    
    self.title = title
    self.locationName = locationName
    self.discipline = discipline
    self.coordinate = coordinate
    
    super.init()
  }
  
  var subtitle: String? {
    return locationName
  }
  
}