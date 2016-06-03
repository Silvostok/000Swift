//
//  NetworkService.swift
//  Restaurants4Square
//
//  Created by Miguel Angel Rubio Caballero on 28/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import Foundation
import ObjectMapper

struct FoursquareService {
  
  func getFoursquare(completion: [Restaurant]? -> Void) {
    
    if let foursquareURL = NSURL(string: ApiURL.restaurantsLists) {
      let networkOperation = NetworkOperation(url: foursquareURL)
      
      networkOperation.downloadJSONFromURL {
        (let JSONArray) in
        let search = Mapper<Response>().map(JSONArray)
        completion(search?.restaurants)
      }
      
    } else {
      print("Could not construct a valid URL")
    }
  }
  
}

