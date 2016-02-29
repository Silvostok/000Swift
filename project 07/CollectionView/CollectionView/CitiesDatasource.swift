//
//  CityDatasource.swift
//  CollectionView
//
//  Created by Miguel Angel Rubio Caballero on 29/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit


class CitiesDatasource {
  
  var cities: [City] = []
  var regions: [String] = []
  
  var count: Int {
    return cities.count
  }
  
  var numberofRegions: Int {
    return regions.count
  }
  
  
  init() {
    cities = loadCitiesFromDisk()
    
  }
  
  
  func cityForItemAtIndexPath(indexPath: NSIndexPath) -> City? {
    if indexPath.section > 0 {
      let cities = citiesForRegion(indexPath.section)
      return cities[indexPath.item]
    } else {
      return cities[indexPath.item]
    }
  }
  
  
  func loadCitiesFromDisk() -> [City]{
    regions.removeAll(keepCapacity: false)
    if let path = NSBundle.mainBundle().pathForResource("Cities", ofType: "plist") {
      if let dictArray = NSArray(contentsOfFile: path) {
        var cities: [City] = []
        for item in dictArray {
          if let dict = item as? NSDictionary {
            let name = dict["caption"] as! String
            let imageName = dict["imageName"] as! String
            let regio = dict["section"] as! String
            let index = dict["index"] as! Int
            let city = City(name: name, imageName: imageName, regio: regio, index: index)
            if !regions.contains(regio) {
              regions.append(regio)
            }
            cities.append(city)
          }
        }
        return cities
      }
    }
    return []

  }
  
  
  private func citiesForRegion(index: Int) -> [City] {
    let regio = regions[index]
    let citiesInRegio = cities.filter { (city: City) -> Bool in
      return city.regio == regio
    }
    return citiesInRegio
  }
  
  
  
  
  
}
