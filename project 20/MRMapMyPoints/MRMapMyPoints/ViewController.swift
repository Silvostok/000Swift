//
//  ViewController.swift
//  MRMapMyPoints
//
//  Created by Miguel Angel Rubio Caballero on 02/06/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController{
  
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet weak var switchField: UISwitch!
  
  var park: MKPointAnnotation!
  var markt: MKPointAnnotation!
  var museo: MKPointAnnotation!
  var currentLocation: MKPointAnnotation!
  let locationManager = CLLocationManager()
  var mapIsMoving: Bool!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    locationManager.delegate = self
    locationManager.requestWhenInUseAuthorization()
    mapIsMoving = false
    mapView.delegate = self
    addMapAnnotation()
  }
  
  func centerLocation(centerPoint: MKPointAnnotation) {
    mapView.setCenterCoordinate(centerPoint.coordinate, animated: true)
  }
  
  func addMapAnnotation() {
    park = MKPointAnnotation()
    park.coordinate = CLLocationCoordinate2D(latitude: 52.360371, longitude: 4.874625)
    park.title = "Vondelpark, the more beatiful park of the Netherlands"
    
    markt = MKPointAnnotation()
    markt.coordinate = CLLocationCoordinate2D(latitude: 36.681916, longitude: -6.135980)
    markt.title = "Plaza de Abasto, local fresh market in Jerez"
    
    museo = MKPointAnnotation()
    museo.coordinate = CLLocationCoordinate2D(latitude: 40.414037, longitude: -3.692291)
    museo.title = "Museo nacional del Prado"
    
    currentLocation = MKPointAnnotation()
    currentLocation.coordinate = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    currentLocation.title = "My Location"
    
    mapView.addAnnotations([park, markt, museo, currentLocation])
  }
  
  
  @IBAction func switchChanged(sender: AnyObject) {
    if switchField.on {
      mapView.showsUserLocation = true
      locationManager.startUpdatingLocation()
    } else {
      mapView.showsUserLocation = false
      locationManager.stopUpdatingLocation()
    }
  }
  
  @IBAction func parkButtonPressed(sender: AnyObject) {
    centerLocation(park)
  }
  
  @IBAction func marktButtonPressed(sender: AnyObject) {
    centerLocation(markt)
  }
  
  @IBAction func museoButtonPressed(sender: AnyObject) {
    centerLocation(museo)
  }
}


extension ViewController: CLLocationManagerDelegate {
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    currentLocation.coordinate = (locations.last?.coordinate)!
    if mapIsMoving == false {
    centerLocation(currentLocation)
    }
  }
}

extension ViewController: MKMapViewDelegate {
  
  func mapView(mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
    mapIsMoving = true
  }
  
  func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
    mapIsMoving = false
  }
  
}


