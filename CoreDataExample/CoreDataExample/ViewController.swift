//
//  ViewController.swift
//  CoreDataExample
//
//  Created by Alan Sax on 1/7/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize coredata for use in this view controller
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        // creates new User entity / savable with core data
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
        
        // setting values for core data object
        newUser.setValue("Alan", forKey: "username")
        newUser.setValue("mypassword", forKey: "password")
        newUser.setValue(23, forKey: "age")
        
        // do catch statement to save new user entity to core data
        do {
            try context.save()
            print("Saved!")
        } catch {
            print("error", error)
        }
        
        // get saved data from core data
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request)
            
            if results.count > 0 {
                for result in results as! [NSManagedObject] {
                    // print("result", result)
                    
                    if let username = result.value(forKey: "username") as? String {
                        print("username:", username)
                    }
                }
            } else {
                print("No results")
            }
        } catch {
            print("couldn fetch results", error)
        }
    }

}

