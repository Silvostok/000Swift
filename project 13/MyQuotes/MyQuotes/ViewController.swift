//
//  ViewController.swift
//  MyQuotes
//
//  Created by Miguel Angel Rubio Caballero on 19/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  @IBOutlet weak var collectionView: UICollectionView!
  
  var gallery = [Art]()
  
  
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.dataSource = self
    collectionView.delegate = self
    
    updateGallery()
    
    if gallery.count == 0 {
      createArt("Snake", productIndentifier: "", imageName: "snake.jpg", purchased: true)
      createArt("Child", productIndentifier: "", imageName: "child.jpg", purchased: false)
      createArt("Bird", productIndentifier: "", imageName: "bird.jpg", purchased: false)
      updateGallery()
      collectionView.reloadData()
    }
    
  }
  
  func createArt(title: String, productIndentifier: String, imageName: String, purchased: Bool) {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext
    
    if let entity = NSEntityDescription.entityForName("Art", inManagedObjectContext: context) {
      let art = NSManagedObject(entity: entity, insertIntoManagedObjectContext: context) as! Art
      
      art.title = title
      art.productIndentifier = productIndentifier
      art.imageName = imageName
      art.purchased = NSNumber(bool: purchased)
      
    }
    
    do {
      try context.save()
    } catch {}
    
    
  }
  
  
  func updateGallery() {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appDelegate.managedObjectContext
    
    let fetch = NSFetchRequest(entityName: "Art")
    
    do {
      let artPieces = try context.executeFetchRequest(fetch)
      gallery = artPieces as! [Art]
      
    } catch {
      
    }
    
    
    
  }
  
  
  
  
  func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return gallery.count
  }
  
  
  func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier("artCell", forIndexPath: indexPath) as! CollectionCell
    
    let art = gallery[indexPath.row]
    
    cell.imageView.image = UIImage(named: art.imageName!)
    cell.nameLabel.text = art.title!
    
    
    for subview in cell.imageView.subviews {
      subview.removeFromSuperview()
    }
    
    if art.purchased!.boolValue {
      cell.purchasedLabel.hidden = true
      
    } else {
      
       cell.purchasedLabel.hidden = false
      
      
      let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Dark)
      let blurView = UIVisualEffectView(effect: blurEffect)
      cell.layoutIfNeeded()
      blurView.frame = cell.imageView.bounds
      cell.imageView.addSubview(blurView)
      
      
      
    }
    
    
    return cell
  }
  
  func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.size.width - 80, height: collectionView.bounds.size.height - 40)
  }
  
  
  
}

