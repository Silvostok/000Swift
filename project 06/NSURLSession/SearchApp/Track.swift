//
//  Track.swift
//  NSURLSession
//
//  Created by Miguel Angel Rubio Caballero on 23/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//


class Track {
  var name: String?
  var artist: String?
   var previewUrl: String?
  
  init(name: String?, artist: String?, previewUrl: String?) {
    self.name = name
    self.artist = artist
    self.previewUrl = previewUrl
  }

}