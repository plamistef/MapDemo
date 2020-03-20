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
            
            let locationInView = sender.location(in: self.mapView)
            let tappedCoordinate = self.mapView.convert(locationInView, toCoordinateFrom: self.mapView)
            
            var name:String!
            
            let alert = UIAlertController(title: "Enter pin name", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "Input the name of your pin..."
            })
            
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                
                name = alert.textFields?.first?.text
               // self.addAnnotation(coordinate: tappedCoordinate, name: name)
                FirebaseRepo.addPin(name: name, lat: tappedCoordinate.latitude, lon: tappedCoordinate.longitude)
                
            }))
            
            self.present(alert, animated: true)
            
        }
    }
    
    /*
    func addAnnotation(coordinate:CLLocationCoordinate2D, name: String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = name
        mapView.addAnnotation(annotation)
    } */
}
