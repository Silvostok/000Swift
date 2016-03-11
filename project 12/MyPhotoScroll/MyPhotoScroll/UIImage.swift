//
//  UIImage.swift
//  MyPhotoScroll
//
//  Created by Miguel Angel Rubio Caballero on 11/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

extension UIImage {
  
  func thumbnailOfSize(size: CGFloat) -> UIImage {
    UIGraphicsBeginImageContext(CGSize(width: size, height: size))
    let rect = CGRectMake(0.0, 0.0, size, size)
    UIGraphicsBeginImageContext(rect.size)
    drawInRect(rect)
    let thumbnail = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext()
    return thumbnail
  }
  
  
  
}
