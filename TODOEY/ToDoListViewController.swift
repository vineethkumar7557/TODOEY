//
//  ViewController.swift
//  TODOEY
//
//  Created by vineeth on 21/02/19.
//  Copyright © 2019 vineeth. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    var listArray = ["Buy Fruits","Go to Movie","Do Home Work"]
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [String]
        {
            listArray = items
        }
        
    }

    // Mark  // Table View DataSource Methods //
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoListCell", for: indexPath)
        cell.textLabel?.text = listArray[indexPath.row]
        
        return cell
        
    }
    
    // Mark - Table View Delegate Methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else
        {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // Mark - Adding New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Todo List", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens when the user is selected
            self.listArray.append(textField.text!)
            self.defaults.set(self.listArray, forKey: "ToDoListArray")
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        
        alert.addAction(action)
        
        self.present(alert, animated: true, completion: nil)
    }
}

