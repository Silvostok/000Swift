//
//  CollectionViewController.swift
//  MyPhotoScroll
//
//  Created by Miguel Angel Rubio Caballero on 11/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

private let reuseIdentifier = "PhotoCell"

class CollectionViewController: UICollectionViewController {
  
  private let thumbnailSize:CGFloat = 70.0
  private let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)
  private let photos = ["photo1", "photo2", "photo3", "photo4", "photo5", "photo6", "photo7", "photo8"]
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  // MARK: - Navigation
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if let cell = sender as? UICollectionViewCell, indexPath = collectionView?.indexPathForCell(cell), zoomedPhotoViewController = segue.destinationViewController as? ZoomedPhotoViewController {
      zoomedPhotoViewController.photoName = "photo\(indexPath.row + 1)"
    }
  }
  
}


// MARK: UICollectionViewDataSource
extension CollectionViewController {
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCell
    let fullSizedImage = UIImage(named:photos[indexPath.row])
    cell.imageView.image = fullSizedImage?.thumbnailOfSize(thumbnailSize)
    return cell
  }
}




// MARK:UICollectionViewDelegateFlowLayout
extension CollectionViewController : UICollectionViewDelegateFlowLayout {
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    return CGSize(width: thumbnailSize, height: thumbnailSize)
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
}

