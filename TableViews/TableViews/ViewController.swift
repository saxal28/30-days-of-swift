//
//  ViewController.swift
//  TableViews
//
//  Created by Alan Sax on 10/26/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var cellContent = ["Alan", "John", "Jacob", "Jerry", "Rex", "Max"];
    
    
    // ====================================
    // MARK: TABLE PROTOCOLS
    // ====================================

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellContent.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath);
        print(indexPath.row)
        cell.textLabel?.text = cellContent[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

