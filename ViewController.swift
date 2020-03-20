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
