//
//  FirstViewController.swift
//  TodoApp
//
//  Created by Alan Sax on 10/26/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class TodosVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todos = NSArray()

    override func viewDidLoad() {
        super.viewDidLoad()
        getTodos()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        getTodos()
        table.reloadData()
    }
    
    
    //====================================
    // MARK: OUTLETS
    //====================================

    
    @IBOutlet weak var table: UITableView!
    
    
    //====================================
    // MARK: TABLE PROTOCOL
    //====================================
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        if todos.count > 0 {
            cell.textLabel?.text = todos[indexPath.row] as? String
        }
        
        return cell

    }
    
    
    //====================================
    // MARK: TODO LOGIC
    //====================================
    
    
    func getTodos() {
        if let data = UserDefaults.standard.object(forKey: "todos") as? NSArray {
            print("TODOS", data)
            todos = data
        } else {
            print("NO TODOS YET")
        }
    }
    
    
    
}

