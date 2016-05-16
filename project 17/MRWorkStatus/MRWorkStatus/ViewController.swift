//
//  ViewController.swift
//  MRWorkStatus
//
//  Created by Miguel Angel Rubio Caballero on 08/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, WorkSatusModelDelegate {
  
  
  
  @IBOutlet weak var labelWorkStatus: UILabel!
  
  
  var workStatusModel: WorkSatusModel?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    workStatusModel = WorkSatusModel()
    workStatusModel?.delegate = self
    
    labelWorkStatus.text = "Ready for Work"
    
    // Do any additional setup after loading the view, typically from a nib.
  }

  

  @IBAction func runWork(sender: AnyObject) {
    
    if let model = workStatusModel {
     labelWorkStatus.text = "Work is requested"
      model.doSomeProcessing()
    }
    
  }
  
  
  
  
  var workTime : UInt32 { return 10 }
  
  func workIsStarting() {
    labelWorkStatus.text = "Work is Starting..."
    
  }
  
  func workIsComplete() {
    labelWorkStatus.text = "Work is Completed"
    
  }
  
  func workInProgress() {
    labelWorkStatus.text = "Work is in progress..."
  }
  
  
  


}

