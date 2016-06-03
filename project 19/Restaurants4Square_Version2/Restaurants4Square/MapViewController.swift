//
//  SecondViewController.swift
//  Restaurants4Square
//
//  Created by Miguel Angel Rubio Caballero on 28/05/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  var restaurants: [Restaurant]!
  
  
  let locationManager = CLLocationManager()
  let initialLocation = CLLocation(latitude: 52.361893, longitude: 4.872018)
  let regionRadius: CLLocationDistance = 700
  
  //MARK: LifeCycle
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    mapView.delegate = self
    locationManager.delegate = self
    addMapAnnotation()
    locationAuthStatus()
    centerMapOnLocation(initialLocation)
  }
  
  //MARK: CLLocationManager
  func locationAuthStatus() {
    if CLLocationManager.authorizationStatus() == .AuthorizedWhenInUse {
      self.mapView.showsUserLocation = true
    } else {
      self.locationManager.requestWhenInUseAuthorization()
    }
  }
  
  
  
  func addMapAnnotation() {
    
      if let restaurants = restaurants {
        dispatch_async(dispatch_get_main_queue()) {
          
          for restaurant in restaurants {
            if let latitude = restaurant.lat, let longitude = restaurant.lng {
              if let name = restaurant.name, let address = restaurant.address {
                
                let annotation = CustomPointAnnotation()
                annotation.coordinate.latitude = CLLocationDegrees(latitude)
                annotation.coordinate.longitude = CLLocationDegrees(longitude)
                annotation.title = name
                annotation.subtitle = address
                annotation.imageName = "IconRest.png"
                self.mapView.addAnnotation(annotation)
              }
            }
          }
        }
      }
    
  }
  
  
  //MARK: navigation
  
  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
  
 
  @IBAction func backButtonPressed(sender: AnyObject) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
}

//MARK: MAPView Delegate

extension MapViewController: MKMapViewDelegate {
  
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    
    if !(annotation is CustomPointAnnotation) {
      return nil
    }
    
    let identifier = "restaurant"
    
    var view = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
    if view == nil {
      view = MKAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      view!.canShowCallout = true
    }
    else {
      view!.annotation = annotation
    }
    
    let cpa = annotation as! CustomPointAnnotation
    view!.image = UIImage(named:cpa.imageName)
    
    return view
  }
  
  
  
  
}

//MARK: Location Manager Delegate

extension MapViewController: CLLocationManagerDelegate {
  
  func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
    if let userLocation: CLLocation = locations[0] {
      let latitude = userLocation.coordinate.latitude
      let longitude = userLocation.coordinate.longitude
      let latDelta: CLLocationDegrees = 0.05
      let lonDelta: CLLocationDegrees = 0.05
      let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
      let centerLocation = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
      
      
      let region = MKCoordinateRegion(center: centerLocation, span: span)
      self.mapView.setRegion(region, animated: true)
      
    }
  }
  
  
  func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print("Errors: " + error.localizedDescription)
  }
  
}

