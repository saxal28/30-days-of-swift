//
//  LocationMapVC.swift
//  MemorablePlaces
//
//  Created by Alan Sax on 11/14/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit
import MapKit

class LocationMapVC: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    var selectedLocation: String = ""
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedLocation == "" ?
            self.setupUserLocationMap() :
            self.setupSavedLocationMap(locationName: selectedLocation)
    }
    
    
    func setupSavedLocationMap(locationName: String) {
        
        let geoLocation = CLGeocoder()
        geoLocation.geocodeAddressString(locationName) { (data, error) in
            if error != nil {
                print("ERROR")
            } else {
                let savedLocation = data![0]
                self.setupMap(userLocation: savedLocation)
            }
        }
        
    }
    
    
    // =============================
    // MARK: USER LOCATION
    // =============================
    
    
    func setupUserLocationMap(){
        
        //setup user location
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        let latitude = locationManager.location?.coordinate.latitude
        let longitude = locationManager.location?.coordinate.longitude
        let location = CLLocation(latitude: latitude!, longitude: longitude!)
        
        let geoLocation = CLGeocoder()
        geoLocation.reverseGeocodeLocation(location) { (data, error) in
            if (error != nil) {
                print("ERROR")
            } else {
                let userLocation = data![0]
                self.setupMap(userLocation: userLocation)
            }
        }
        
    }
    
    
    // =============================
    // MARK: MAP
    // =============================
    
    
    func setupMap(userLocation: CLPlacemark) {
        
        let latitude: CLLocationDegrees = (userLocation.location?.coordinate.latitude)!
        let longitude: CLLocationDegrees = (userLocation.location?.coordinate.longitude)!
        let latDelta = 0.05
        let longDelta = 0.05
        
        let center = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: longDelta)
        let region = MKCoordinateRegion(center: center, span: span);
        
        map.setRegion(region, animated: true)
        
        //add marker
        let annotation: MKPointAnnotation = MKPointAnnotation()
        annotation.title = userLocation.name
        annotation.coordinate = center
        map.addAnnotation(annotation)
        
        // add longpress
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        longPress.minimumPressDuration = 1.5
        map.addGestureRecognizer(longPress)
        
    }
    
    @objc func handleLongPress(gestureRecognizer: UIGestureRecognizer) {
        
        if gestureRecognizer.state == UIGestureRecognizerState.began {
            
            let touchPoint = gestureRecognizer.location(in: self.map)
            let coordinate  = map.convert(touchPoint, toCoordinateFrom: self.map)
            let latitude = coordinate.latitude
            let longitude = coordinate.longitude
            let location = CLLocation(latitude: latitude, longitude: longitude)
            
            let geoLocation = CLGeocoder()
            geoLocation.reverseGeocodeLocation(location) { (data, error) in
                if error != nil {
                    print("error")
                } else {
                    let spot: CLPlacemark = data![0]
                    let name = spot.name!
                    
                    // add map marker
                    let marker = MKPointAnnotation()
                    marker.title = name
                    marker.coordinate = coordinate
                    self.map.addAnnotation(marker)
                    
                    // save location
                    self.saveLocation(locationName: name)
                }
            }
            
        }
    }
    
    
    // =============================
    //  USER DEFAULTS -> LOCAL STORAGE
    // =============================
    
    
    func saveLocation(locationName: String) {
    
        if let savedLocations = UserDefaults.standard.array(forKey: "locations") {
            print("saved locations!", savedLocations)
            var locations = savedLocations
            locations.append(locationName)
            UserDefaults.standard.set(locations, forKey: "locations")
        } else {
            print("save sole location")
            var locations: [String] = []
            locations.append(locationName)
            UserDefaults.standard.set(locations, forKey: "locations")
        }
        
    }
    
}
