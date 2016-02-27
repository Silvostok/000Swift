//
//  Datasource.swift
//  Segue
//
//  Created by Miguel Angel Rubio Caballero on 26/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit


class Datasource: NSObject {
  
  var cities: [City]
  
  override init() {
   
    let cadiz = City()
    cadiz.name = "Cadiz"
    cadiz.regio = "Andalucia"
    cadiz.id = "1"
    cadiz.image = UIImage(named: "cadiz")!
  
    let vigo = City()
    vigo.name = "Vigo"
    vigo.regio = "Galicia"
    vigo.id = "2"
    vigo.image = UIImage(named: "vigo")!
    
    let caceres = City()
    caceres.name = "Caceres"
    caceres.regio = "Extremadura"
    caceres.id = "3"
    caceres.image = UIImage(named: "caceres")!
    
    let valencia = City()
    valencia.name = "Valencia"
    valencia.regio = "Valencia"
    valencia.id = "4"
    valencia.image = UIImage(named: "valencia")!
  
    let sevilla = City()
    sevilla.name = "Sevilla"
    sevilla.regio = "Andalucia"
    sevilla.id = "5"
    sevilla.image = UIImage(named: "sevilla")!
    
    let bilbao = City()
    bilbao.name = "Bilbao"
    bilbao.regio = "Euskadi"
    bilbao.id = "6"
    bilbao.image = UIImage(named: "bilbao")!
    
    let zamora = City()
    zamora.name = "Zamora"
    zamora.regio = "Castilla-Leon"
    zamora.id = "7"
    zamora.image = UIImage(named: "zamora")!
    
    let soria = City()
    soria.name = "Soria"
    soria.regio = "Castilla-Leon"
    soria.id = "8"
    //soria.image = UIImage(asset: .Soria)
    soria.image = UIImage(asset: .Soria)
    
  
    cities = [cadiz, vigo, caceres, valencia, sevilla, bilbao, zamora, soria]
    
    
    //let sortedCities = cities.sort { $0.name < $1.name}
    
    cities.sortInPlace({ result1, result2 in
      return result1.name.localizedStandardCompare(
      result2.name) == .OrderedAscending
      })
  
    //cities.sortInPlace { $0 < $1 }
    
    //cities.sortInPlace(<)
  }
  
  func cityFromID(id: String) -> City? {
    for city in cities {
      if city.id == id {
        return city
      }
    }
    return nil
  }
  
  
  
  
  
  
  
  
  
  
  
}