//
//  PhotoStreamViewController
//  CustomCVLayout
//
//  Created by Miguel Angel Rubio Caballero on 01/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoStreamViewController: UICollectionViewController {
  
  
  
  var photos = Photo.allPhotos()
  


  override func preferredStatusBarStyle() -> UIStatusBarStyle {
    return UIStatusBarStyle.LightContent
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    collectionView!.backgroundColor = UIColor.clearColor()
    collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
    
    //let size = CGRectGetWidth(collectionView!.bounds) / 2
  let layout = collectionViewLayout as! PinterestLayout
    layout.cellPadding = 5
    layout.delegate = self
    layout.numberOfColumns = 2
    
  }
  

}


extension PhotoStreamViewController {
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedPhotoCell", forIndexPath: indexPath) as! AnnotatedPhotoCell
    
    cell.photo = photos[indexPath.item]
    
    return cell
  }
  
}


extension PhotoStreamViewController: PinterestLayoutDelegate {
  
  func collectionView(collectionView: UICollectionView, heightForPhotoAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
    
    let photo = photos[indexPath.item]
    let boundingRect = CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
    let rect = AVMakeRectWithAspectRatioInsideRect(photo.image.size, boundingRect)
    return rect.height
  
  }
  
  func collectionView(collectionView: UICollectionView, heightForAnnotationAtIndexPath indexPath: NSIndexPath, withWidth width: CGFloat) -> CGFloat {
    
    let photo = photos[indexPath.item]
    let font = UIFont(name: "HelveticaNeue-light", size: 12)!
    let commentHeight = photo.heightForComment(font, width: width)
    let height = 4 + 17 + commentHeight + 4
    return height
  }
  
  
}









