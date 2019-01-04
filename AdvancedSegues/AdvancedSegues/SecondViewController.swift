//
//  SecondViewController.swift
//  AdvancedSegues
//
//  Created by Alan Sax on 11/14/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var username = "Initial Username"
    var activeRow = 0;
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = String(activeRow)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}