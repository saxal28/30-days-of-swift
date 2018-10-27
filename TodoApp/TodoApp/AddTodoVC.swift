//
//  SecondViewController.swift
//  TodoApp
//
//  Created by Alan Sax on 10/26/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class AddTodoVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    //====================================
    // MARK: OUTLETS
    //====================================
    
    
    @IBOutlet weak var todoTextField: UITextField!
    
    
    //====================================
    // MARK: ACTIONS
    //====================================

    @IBAction func addTodoPressed(_ sender: Any) {
        let todo = todoTextField.text!;
        
        todo == "" ? print("EMPTY") : addTodo(todo: todo)
    }
    
    
    func addTodo(todo: String) {
        var todos = NSMutableArray();
        
        //fetch todos
        if let data = UserDefaults.standard.object(forKey: "todos") as? NSMutableArray {
            todos = data.mutableCopy() as! NSMutableArray
        }
        //add todo to end
        todos.add(todo)

        // save todo
        UserDefaults.standard.set(todos as NSArray, forKey: "todos")
       
        //clear text field
        todoTextField.text = ""
        
        //close keyboard
        todoTextField.resignFirstResponder()
    }
    
}

