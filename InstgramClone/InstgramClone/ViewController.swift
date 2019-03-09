//
//  ViewController.swift
//  InstgramClone
//
//  Created by Alan Sax on 3/9/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
//        let comment = PFObject(className: "Comment")
//        comment["text"] = "Nice Shot!"
//        comment.saveInBackground { (success, error) in
//            if(success) {
//                print("SAVE SUCCESSFUL!")
//            } else {
//                print("ERROR", error!)
//            }
//        }
        
//    let query = PFQuery(className: "Comment")
//        query.getObjectInBackground(withId: "kP1Tq2aHaW") { (object, error) in
//            if let comment = object {
//                print("COMMENT!", comment["text"])
//                comment["text"] = "Updated Comment"
//                comment.saveInBackground(block: { (success, error) in
//                    if(success) {
//                        print("update successful!")
//                    }
//                })
//            }
//        }
        
        let tweet = PFObject(className: "Tweet")
        tweet["contnet"] = "Good Moring World!"
        tweet.saveInBackground { (success, error) in
            print("TWEET SAVED")
        }
        
        
     }


}

