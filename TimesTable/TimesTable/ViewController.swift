//
//  ViewController.swift
//  TimesTable
//
//  Created by Alan Sax on 10/26/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var multiplier = 1;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    // ===============================
    // OUTLETS
    // ===============================
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var table: UITableView!
    
    
    // ===============================
    // ACTIONS
    // ===============================
    
    
    @IBAction func onSliderChange(_ sender: Any) {
        multiplier = Int(slider.value);
        print("multiplier", multiplier);
        table.reloadData();
    }
    
    
    // ===============================
    // TABLE PROTOCOLS
    // ===============================
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        cell.textLabel?.text = String((indexPath.row + 1) * multiplier);
        return cell;
    }
    

}

