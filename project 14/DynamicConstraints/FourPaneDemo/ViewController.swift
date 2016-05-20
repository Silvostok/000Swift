//
//  ViewController.swift
//  FourPaneDemo
//
//  Created by Miguel Angel Rubio Caballero on 18/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
  
  
  @IBOutlet weak var mapView: MKMapView!
  
  @IBOutlet weak var webView: UIWebView!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    
    //Initializing webView
    
    let webURL = "https://www.facebook.com/VanGoghMuseum/?fref=ts"
    
    let request = NSURLRequest(URL: NSURL(string: webURL)!)
    webView.loadRequest(request)
    
    //center mapView
    
    
    let lat = 52.358493
    let long = 4.880885
    
    let downTown = MKPointAnnotation()
    downTown.coordinate = CLLocationCoordinate2D(latitude: lat, longitude: long)
  downTown.title = "Centro historico de Amterdam"
    
    mapView.addAnnotation(downTown)
    
    let region: MKCoordinateRegion = MKCoordinateRegionMakeWithDistance(downTown.coordinate, 1000, 1000)
    
    let adjusted: MKCoordinateRegion = mapView.regionThatFits(region)
    
    mapView.setRegion(adjusted, animated: true)
    
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

