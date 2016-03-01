//
//  PhotoStreamViewController
//  CustomCVLayout
//
//  Created by Miguel Angel Rubio Caballero on 01/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class PhotoStreamViewController: UICollectionViewController {
  
  
  var colors: [UIColor] {
    get {
      var colors = [UIColor]()
      let palette = [UIColor.redColor(), UIColor.greenColor(), UIColor.blueColor(), UIColor.orangeColor(), UIColor.purpleColor(), UIColor.yellowColor()]
      var paletteIndex = 0
      for _ in 0..<photos.count {
        colors.append(palette[paletteIndex])
        paletteIndex = paletteIndex == (palette.count - 1) ? 0 : ++paletteIndex
      }
      return colors
    }
  }
  
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
    let size = CGRectGetWidth(collectionView!.bounds) / 2
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: size, height: size)
  }


}


extension PhotoStreamViewController {
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("AnnotatedPhotoCell", forIndexPath: indexPath) as UICollectionViewCell
    cell.contentView.backgroundColor = colors[indexPath.item]
    return cell
  }
  
}

