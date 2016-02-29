//
//  GradientView.swift
//  CollectionView
//
//  Created by Miguel Angel Rubio Caballero on 29/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class GradientView: UIView {
  
  lazy private var gradientLayer: CAGradientLayer = {
    let layer = CAGradientLayer()
    layer.colors = [UIColor.clearColor().CGColor, UIColor(white: 0.0, alpha: 0.75).CGColor]
    layer.locations = [NSNumber(float: 0.0), NSNumber(float: 1.0)]
    return layer
    }()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = UIColor.clearColor()
    layer.addSublayer(gradientLayer)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    gradientLayer.frame = bounds
  }
  
}
