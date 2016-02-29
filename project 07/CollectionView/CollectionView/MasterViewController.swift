//
//  ViewController.swift
//  CollectionView
//
//  Created by Miguel Angel Rubio Caballero on 28/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit


private let reuseIdentifier = "CityCell"

class MasterViewController: UICollectionViewController {
  
  var citiesDatasource = CitiesDatasource()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let width = CGRectGetWidth(collectionView!.frame) / 3
    let layout = collectionViewLayout as! UICollectionViewFlowLayout
    layout.itemSize = CGSize(width: width, height: width)
    
  }
  
  
  
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    
    if segue.identifier == "MasterToDetail" {
      let detailViewController = segue.destinationViewController as! DetailViewController
      detailViewController.city = sender as? City
    }
    
  }
  
  
  // MARK: - Datasource and delegate
  
  override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
    return 1
  }
  
  
  override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return citiesDatasource.count
  }
  
  override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
    
    let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as? CityCell
    
    
    if let city = citiesDatasource.cityForItemAtIndexPath(indexPath) {
      cell?.city = city
    }
    
    
    return cell!
  }
  
  
  
  override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
    
    if let city = citiesDatasource.cityForItemAtIndexPath(indexPath) {
      performSegueWithIdentifier("MasterToDetail", sender: city)
    }
    
    
  }
  
  
  
}

