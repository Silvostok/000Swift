//
//  ViewController.swift
//  ViewTransition
//
//  Created by Miguel Angel Rubio Caballero on 18/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var flipped = false
  let button = UIButton(type: .Custom)

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.blackColor()
    button.titleLabel?.font = UIFont.systemFontOfSize(72, weight: 0)
    button.setTitle("😛", forState: UIControlState.Normal)
    button.addTarget(self, action: "flip", forControlEvents: .TouchUpInside)
    
    view.addSubview(button)
    
    button.sizeToFit()
    button.center = view.center
  }

  
  func flip() {
    flipped = !flipped
    
    UIView.transitionWithView(
      button,
      duration: 0.3,
      options: .TransitionFlipFromTop,
      animations: {
        self.button.setTitle(self.flipped ? "😛" : "🤑", forState: .Normal)
      },
      completion: nil
    )
  }
}

