//
//  ViewController.swift
//  UserDefaultsSaveNumber
//
//  Created by Alan Sax on 10/26/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var phoneNumberToSave = ""
    var savedPhoneNumber = "";
    
    
    //===========================
    // OUTLETS
    //===========================
    
    
    @IBOutlet weak var textInput: UITextField!
    
    
    //===========================
    // ACTIONS
    //===========================
    
    
    @IBAction func saveNumberPressed(_ sender: Any) {
        saveNumberToUserDefaults()
        updateInputText(text: phoneNumberToSave)
    }
    
    @IBAction func deleteNumberPressed(_ sender: Any) {
        removeNumberFromUserDefaults()
        updateInputText(text: "")
    }
    
    
    //===========================
    // USER DEFAULTS
    //===========================
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadNumberFromUserDefaults()
        updateInputText(text: savedPhoneNumber);

    }
    
    
    func saveNumberToUserDefaults() {
        
        phoneNumberToSave = textInput.text!;
        
        UserDefaults.standard.set(phoneNumberToSave, forKey: "phoneNumber")
        
        print("TEST", phoneNumberToSave)
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
    
    
    func updateInputText(text: String) {
        textInput.text = text;
    }



}

