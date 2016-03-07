//
//  ViewController.swift
//  AdamPublicArt
//
//  Created by Miguel Angel Rubio Caballero on 05/03/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
  
  @IBOutlet weak var mapView: MKMapView!
  
  let regionRadius: CLLocationDistance = 1000
  

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    let initialLocation = CLLocation(latitude: 52.357419, longitude: 4.867983)
    centerMapOnLocation(initialLocation)
    
  // show artwork on map
    let artwork = Artwork(title: "Picasso Beeld", locationName: "Weide in Vondelpark", discipline: "Beeld", coordinate: CLLocationCoordinate2D(latitude: 52.357419, longitude: 4.867983))
    mapView.addAnnotation(artwork)
    
    mapView.delegate = self
    
  }

  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
      regionRadius * 2.0, regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
  }
}


extension ViewController: MKMapViewDelegate {
  
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    
    if let annotation = annotation as? Artwork {
      let identifier = "pin"
      var view: MKPinAnnotationView
      if let dequeuedView = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier)
        as? MKPinAnnotationView { // 2
          dequeuedView.annotation = annotation
          view = dequeuedView
      } else {
        // 3
        view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
        view.canShowCallout = true
        view.calloutOffset = CGPoint(x: -5, y: 5)
        view.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure) as UIView
      }
      return view
    }
    return nil
  }
    
      
  
  
  
  
  
  
}