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
            
            let locationInView = sender.location(in: self.mapView)
            let tappedCoordinate = self.mapView.convert(locationInView, toCoordinateFrom: self.mapView)
                     
            var name:String!
            
            let alert = UIAlertController(title: "Enter pin name", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

            alert.addTextField(configurationHandler: { textField in
                textField.placeholder = "Input the name of your pin..."
            })

            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in

                 name = alert.textFields?.first?.text //{
                    print(name!)
                
                self.addAnnotation(coordinate: tappedCoordinate, name: name)

               // }
            }))

            self.present(alert, animated: true)
            
               }
    }
    
    
    func addAnnotation(coordinate:CLLocationCoordinate2D, name: String){
    let annotation = MKPointAnnotation()
    annotation.coordinate = coordinate
    annotation.title = name
    mapView.addAnnotation(annotation)
}
}
