//
//  ViewController.swift
//  Maps
//
//  Created by Alan Sax on 10/31/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ==========================
        // MAP INIT
        // ==========================
        
        let latitude: CLLocationDegrees = 41.8902102
        let longitude: CLLocationDegrees =  12.4900529
        
        let latitudeDelta: CLLocationDegrees = 0.005;
        let longitudeDelta: CLLocationDegrees = 0.005;
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)
        
        // ==============================
        // ADD ANNOTATION (MAP MARKER)
        // ==============================
        
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.title = "Colosseum"
        annotation.subtitle = "I will go back some day..."
        annotation.coordinate = location
        
        map.addAnnotation(annotation)
        
        // ==============================
        // LONGPRESS GESTURE RECOGNIZER
        // ==============================
        
        let longPressGestureRecongizer = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPressGestureRecongizer.minimumPressDuration = 2
        map.addGestureRecognizer(longPressGestureRecongizer)
        
    }
    
    
    @objc func handleLongPress(gestureRecognizer: UIGestureRecognizer){
        print("added long press!", gestureRecognizer)
        
        let touchPoint = gestureRecognizer.location(in: self.map)
        let coordinate = map.convert(touchPoint, toCoordinateFrom: self.map)
        
        let annotation = MKPointAnnotation()
        annotation.title = "New Place"
        annotation.subtitle = "Sounds cool."
        annotation.coordinate = coordinate
        
        map.addAnnotation(annotation)
        
    }


}

