//
//  WorkStatusModel.swift
//  MRWorkStatus
//
//  Created by Miguel Angel Rubio Caballero on 08/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import Foundation




@objc protocol WorkSatusModelDelegate {
  
  var workTime : UInt32 { get }
  
  func workIsStarting()
  func workIsComplete()
  
  optional func workInProgress()
}



class WorkSatusModel {
  
  var delegate: WorkSatusModelDelegate?
  
  
  func doSomeProcessing() {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), { () -> Void in
      // let them know that we are starting
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
        self.delegate?.workIsStarting()
      })
      
      // do some stuff
      var workTime : UInt32 = 0
      if let del = self.delegate {
        workTime = del.workTime
      }
      
      while 0 < workTime { sleep(1)
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
        self.delegate?.workInProgress?()
      })
        
        workTime -= 1
      }
      
      dispatch_async(dispatch_get_main_queue(), { () -> Void in
        self.delegate?.workIsComplete()
      })
    })
  }
  
  
  
}
