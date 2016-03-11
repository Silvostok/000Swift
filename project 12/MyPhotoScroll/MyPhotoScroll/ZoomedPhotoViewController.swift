//
//  ZoomedPhotoViewController.swift
//  MyPhotoScroll
//
//  Created by Miguel Angel Rubio Caballero on 11/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ZoomedPhotoViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var scrollView: UIScrollView!
  @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
  @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
  
  var photoName: String!
  
  override func viewDidLoad() {
    imageView.image = UIImage(named: photoName)
    
    updateMinZoomScaleForSize(view.bounds.size)
  }

  
  private func updateMinZoomScaleForSize(size: CGSize) {
    let widthScale = size.width / imageView.bounds.width
    let heightScale = size.height / imageView.bounds.height
    let minScale = min(widthScale, heightScale)
    
    scrollView.minimumZoomScale = minScale
    
    scrollView.zoomScale = minScale
  }
  
  
  private func updateConstraintsForSize(size: CGSize) {
    let yOffset = max(0, (size.height - imageView.frame.height) / 2)
    imageViewTopConstraint.constant = yOffset
    imageViewBottomConstraint.constant = yOffset
    
    let xOffset = max(0, (size.width - imageView.frame.width) / 2)
    imageViewLeadingConstraint.constant = xOffset
    imageViewTrailingConstraint.constant = xOffset
    view.layoutIfNeeded()
  }

}


extension ZoomedPhotoViewController: UIScrollViewDelegate {
  
  func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
    return imageView
  }
  
  func scrollViewDidZoom(scrollView: UIScrollView) {
    updateConstraintsForSize(view.bounds.size)
  }
  
  
}
