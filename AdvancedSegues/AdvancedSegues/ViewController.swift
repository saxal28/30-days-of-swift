//
//  ViewController.swift
//  AdvancedSegues
//
//  Created by Alan Sax on 11/14/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

// this variable is available everywhere since outside of class definition
let globalVariable = "this is global" // this is bad practice

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var activeRow = 0;
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        activeRow = indexPath.row
        performSegue(withIdentifier: "toSecondViewController", sender: nil)
    }
    
    
    var username = "Initial Username"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSecondViewController" {
            
            let secondVC = segue.destination as! SecondViewController
            
            secondVC.activeRow = activeRow
            
        }
        
    }

}

