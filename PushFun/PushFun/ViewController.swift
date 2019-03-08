//
//  ViewController.swift
//  PushFun
//
//  Created by Alan Sax on 3/7/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad()  {
        super.viewDidLoad()
        
        if let url = URL(string: "https://fcm.googleapis.com/v1/projects/auth-aed3b/messages:send") {
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = [
                "Content-Type": "application/json",
                "Authorization": "key=AAAAlpFO8qc:APA91bGafOSlM9r6008PBxEM8-ZBKc3oD-zwYFVI-b8lgvT5fTRWmQWswHeFdXrdsahAeINtvtsOaKoATNUygRjvbtZqrjLYTNztGpMv5MBxjNV7ngzGEHYfmTyyG18iQeQo-rQO4Ih"
            ]
            request.httpMethod = "POST"
            request.httpBody = "{\"to\": \"ceQn70GcRkM:APA91bFDADoQCyCKwzen7-Qq4R_7eYFEmJelJzIe8e-xsHZ5j0W2SBCYcOYYyC8crVJJtdTLyctRNLr_fQhOxj9VuB0RLd-d6E8GnahU93HAv1QOlPdqhHzU5po9o_nZkiSWDQkGrKKt\", \"notification\", : {\"title\": \"this is from HTTP!\"}}".data(using: .utf8)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if error != nil {
                    print("ERROR!", error!)
                } else {
                    print("SUCCESS!")
                }
            }.resume()
        }
        
        
    }


}

