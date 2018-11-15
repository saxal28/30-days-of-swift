//
//  ViewController.swift
//  FindingUserLocation
//
//  Created by Alan Sax on 11/9/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var map: MKMapView!
    var locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // =================================
        // SETTING UP USER LOCATION
        // =================================
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }
    
    // =================================
    // INIT MAP
    // =================================
    
    func initMap(userLocation: CLLocation) {
        
        let latitude: CLLocationDegrees = userLocation.coordinate.latitude
        let longitude: CLLocationDegrees = userLocation.coordinate.longitude
        
        let latitudeDelta: CLLocationDegrees = 0.005;
        let longitudeDelta: CLLocationDegrees = 0.005;
        
        let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta)
        let location: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        
        let region = MKCoordinateRegion(center: location, span: span)
        
        map.setRegion(region, animated: true)

    }
    
    //FIRES EVERTTIME THE USERS LOCATION CHANGES
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation: CLLocation = locations[0]
        initMap(userLocation: userLocation)
    }


}

