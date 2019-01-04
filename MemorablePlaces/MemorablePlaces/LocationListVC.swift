//
//  LocationListVC.swift
//  MemorablePlaces
//
//  Created by Alan Sax on 11/14/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class LocationListVC: UITableViewController {
    
    var savedLocations: [String] = []
    var selectedLocation: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSavedLocations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        loadSavedLocations()
        selectedLocation = ""
    }
    
    // ===============================
    // MARK: - TABLE
    // ===============================
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedLocations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = savedLocations[indexPath.row]
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedLocation = savedLocations[indexPath.row]
        performSegue(withIdentifier: "toLocationMapVC", sender: nil)
    }
    
    // ===============================
    // MARK: - USER DEFAULTS - LOCAL STORAGE
    // ===============================
    
    func loadSavedLocations() {
        
        if let locations =  UserDefaults.standard.object(forKey: "locations") {
            savedLocations = locations as! Array
            tableView.reloadData()
        }
    }

    // ===============================
    // MARK: - Navigation
    // ===============================

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLocationMapVC" {
            let vc = segue.destination as! LocationMapVC
            vc.selectedLocation = self.selectedLocation
        }
    }

}
