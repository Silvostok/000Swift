//
//  Quote.swift
//  MFQuotes
//
//  Created by Miguel Angel Rubio Caballero on 11/04/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import Foundation

class Quote: NSObject, NSCoding {
  
  let concept: String
  let definition: String
  
  init(concept: String, definition: String) {
    self.concept = concept
    self.definition = definition
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    concept = aDecoder.decodeObjectForKey(Keys.Concept.rawValue) as! String
    definition = aDecoder.decodeObjectForKey(Keys.Concept.rawValue) as! String
  }

  
  func encodeWithCoder(aCoder: NSCoder) {
    aCoder.encodeObject(concept, forKey: Keys.Concept.rawValue)
    aCoder.encodeObject(definition, forKey: Keys.Concept.rawValue)
  }
  
  
  enum Keys: String {
    case Concept = "concept"
    case Definition = "definition"
    
  }
  
}


class ModelController {

//let quote = Quote(concept: "Espacio Antropológico", definition: "Eje radial, eje circular y eje anguar")
 let quoteFilePath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first! + "/quote.txt"
  
  var quote: Quote {
    
    get {
      return NSKeyedUnarchiver.unarchiveObjectWithFile(quoteFilePath) as? Quote
        ?? Quote(concept: "Espacio Antropológico", definition: "Eje radial, eje circular y eje anguar")
      
    } set {
      NSKeyedArchiver.archiveRootObject(newValue, toFile: quoteFilePath)
      
    }
    
    
  }
  
  
  
  
  
  



}
