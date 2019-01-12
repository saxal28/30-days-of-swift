//
//  ViewController.swift
//  APIDemo
//
//  Created by Alan Sax on 1/10/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22")!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
        
            if error != nil {
                print("error fetching data!");
            } else {
                
                if let urlContent = data {
                    
                    do {
                        let jsonResult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        print(jsonResult)
                        
                    } catch {
                        print(error)
                    }
                    
                }
                
            }
        }
        
        task.resume()
    }


}

