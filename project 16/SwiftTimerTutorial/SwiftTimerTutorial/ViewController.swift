//
//  ViewController.swift
//  SwiftTimerTutorial
//
//  Created by Miguel Angel Rubio Caballero on 08/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  
  @IBOutlet weak var countingLabel: UILabel!
  
  
  
  var swiftTimer = NSTimer()
  
  var swiftCounter = 0
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    
    countingLabel.text = String(swiftCounter)
    
  }

  
  func updateCounter() {
    countingLabel.text = String(swiftCounter++)
  }
  
  @IBAction func startButton(sender: AnyObject) {
    
    swiftTimer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateCounter), userInfo: nil, repeats: true)
  }
  
  
  @IBAction func pauseButton(sender: AnyObject) {
    
    swiftTimer.invalidate()
    
  }
  
  @IBAction func clearButton(sender: AnyObject) {
    
    swiftTimer.invalidate()
    swiftCounter = 0
    countingLabel.text = String(swiftCounter)
  }

}

