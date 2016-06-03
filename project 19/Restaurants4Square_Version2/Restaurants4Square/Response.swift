//
//  Response.swift
//  Restaurants4Square
//
//  Created by Miguel Angel Rubio Caballero on 28/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import Foundation
import ObjectMapper

class Response: Mappable {
    
    var restaurants: [Restaurant]?
    
    required init?(_ map: Map) { }
    
    // Mappable
    func mapping(map: Map) {
        restaurants    <- map["response.groups.0.items"]
    }
    
}
