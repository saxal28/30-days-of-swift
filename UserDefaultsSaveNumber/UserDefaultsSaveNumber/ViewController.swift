//
//  ViewController.swift
//  UserDefaultsSaveNumber
//
//  Created by Alan Sax on 10/26/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var phoneNumberToSave = "123-456-7891"
    var savedPhoneNumber = "";
    
    
    //===========================
    // OUTLETS
    //===========================
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    //===========================
    // ACTIONS
    //===========================
    
    
    @IBAction func saveNumberPressed(_ sender: Any) {
        saveNumberToUserDefaults()
        phoneNumberLabel.text = phoneNumberToSave

    }
    
    @IBAction func deleteNumberPressed(_ sender: Any) {
        removeNumberFromUserDefaults()
        phoneNumberLabel.text = ""
    }
    
    
    //===========================
    // USER DEFAULTS
    //===========================
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNumberFromUserDefaults()
        phoneNumberLabel.text = savedPhoneNumber

    }
    
    
    func saveNumberToUserDefaults() {
        UserDefaults.standard.set(phoneNumberToSave, forKey: "phoneNumber")
    }
    
    func loadNumberFromUserDefaults() {
        
        if let phoneNumber = UserDefaults.standard.object(forKey: "phoneNumber") as? String {
            savedPhoneNumber = phoneNumber
        } else {
            print("no number saved");
        }
        
    }
    
    func removeNumberFromUserDefaults(){
        UserDefaults.standard.removeObject(forKey: "phoneNumber");
    }



}

