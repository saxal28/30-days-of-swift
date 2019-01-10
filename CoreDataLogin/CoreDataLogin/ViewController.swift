//
//  ViewController.swift
//  CoreDataLogin
//
//  Created by Alan Sax on 1/9/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var context:NSManagedObjectContext = NSManagedObjectContext.init(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
    
    var isUserLoggedIn: Bool = false
    var username: String = ""
    
    // ========================
    // outlets
    // ========================
    
    @IBOutlet weak var headerText: UILabel!
    @IBOutlet weak var usernameText: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    
    // ========================
    // actions
    // ========================
    
    @IBAction func handleInput(_ sender: Any) {
        print("typing!")
        shouldEnableLoginButton()
    }
    
    @IBAction func handleLoginButtonPress(_ sender: Any) {
        
        if loginButton.currentTitle == "Logout" {
            deleteLoggedInUser()
            setupLoginView()
            
        } else {
            saveUser()
            setupLogoutView()
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //initialize core data for use
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.persistentContainer.viewContext
        
        getLoggedInUser()
        isUserLoggedIn ? setupLogoutView() : setupLoginView()
    
    }
    
    func setupLoginView(){
        shouldEnableLoginButton()
        usernameText.isHidden = true
        headerText.text = "Login"
        usernameText.isHidden = true
        
        usernameInput.isHidden = false
        passwordInput.isHidden = false
        emailInput.isHidden = false
        
        loginButton.setTitle("Login", for: UIControlState.normal)
        loginButton.backgroundColor = #colorLiteral(red: 1, green: 0.1568113565, blue: 0.2567096651, alpha: 1)
    }
    
    func setupLogoutView(){
        headerText.text = "Logged In"
        usernameText.isHidden = false
        usernameText.text = username
        
        usernameInput.isHidden = true
        passwordInput.isHidden = true
        emailInput.isHidden = true
        
        loginButton.setTitle("Logout", for: UIControlState.normal)
        loginButton.backgroundColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    }
    
    func shouldEnableLoginButton() {
        let username = usernameInput.text!
        let email = emailInput.text!
        let password = passwordInput.text!
        
        if(username == "" || email == "" || password == "") {
            loginButton.isEnabled = false
            loginButton.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        } else {
            loginButton.isEnabled = true
            loginButton.backgroundColor = #colorLiteral(red: 1, green: 0.1568113565, blue: 0.2567096651, alpha: 1)
        }
    }
    
    // ========================
    // MARK: Core Data methods
    // ========================
    
    func saveToCoreData(newUser: NSManagedObject) {
        
        do {
            try context.save()
            print("saved!")
            username = newUser.value(forKey: "username") as! String
        } catch {
            print("Cannot save to core data", error)
        }
        
    }
    
    func saveUser(){
        let username = usernameInput.text!
        let email = emailInput.text!
        let password = passwordInput.text!
        
        let newUser = NSEntityDescription.insertNewObject(forEntityName: "User", into: context)
        newUser.setValue(username, forKey: "username")
        newUser.setValue(email, forKey: "email")
        newUser.setValue(password, forKey: "password")
        
        saveToCoreData(newUser: newUser)
    }
    
    func deleteLoggedInUser() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            for result in results {
                context.delete(result)
            }
            isUserLoggedIn = false
        } catch {
            print("cannot get items", error)
        }
        
        do {
            try context.save()
            print("deleted user!")
        } catch {
            print("Cannot delete user from core data", error)
        }
        
    }
    
    func getLoggedInUser() {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        
        do {
            let results = try context.fetch(request) as! [NSManagedObject]
            
            if results.count > 0 {
                isUserLoggedIn = true
                username = results[0].value(forKey: "username") as! String
            } else {
                print("no logged in user")
            }
            
        } catch {
            print("cannot get items", error)
        }
        
    }


}

