//
//  ViewController.swift
//  MapDemo
//
//  Created by Plam Stefanova on 3/20/20.
//  Copyright © 2020 Plam Stefanova. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      /*  let marker = MKPointAnnotation() // create an empty marker
        marker.title = "Go here" // a message on the marker
        let location = CLLocationCoordinate2D(latitude: 55.7, longitude: 12.5) // Denmark in the world
        marker.coordinate = location // add the location to this marker
        mapView.addAnnotation(marker)// is a marker (red), where the user can click for more info
        */
        FirebaseRepo.startListener(vc: self)
    }
    func updateMarkers
        (markers:[MKPointAnnotation]) {
        print("updating markers...")
        // make a loop, iterating through the markers list
        mapView.removeAnnotations(mapView.annotations) // clear the map
        mapView.addAnnotations(markers)
        
    }
    @IBAction func longPress(_ sender: UILongPressGestureRecognizer) {
         if sender.state == .ended{
                   let locationInView = sender.location(in: mapView)
                   let tappedCoordinate = mapView.convert(locationInView, toCoordinateFrom: mapView)
                   addAnnotation(coordinate: tappedCoordinate)
               }
    }
    func addAnnotation(coordinate:CLLocationCoordinate2D){
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    mapView.addAnnotation(annotation)
}
}
