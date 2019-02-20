//
//  ViewController.swift
//  TODOEY
//
//  Created by vineeth on 21/02/19.
//  Copyright © 2019 vineeth. All rights reserved.
//

import UIKit

class ToDoListViewController: UITableViewController{

    var listArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Buy Fruits"
        listArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Busdy Fruits"
        listArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Buay Fruits"
        listArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Item]
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
        
        let item = listArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        // ternary operator
        // value = condition ? valueIsTrue : valueIsFalse
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
//        if item.done == true {
//            cell.accessoryType = .checkmark
//        }
//        else
//        {
//            cell.accessoryType = .none
//        }
        
        return cell
        
    }
    
    // Mark - Table View Delegate Methods
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        listArray[indexPath.row].done = !listArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    

    }
    
    // Mark - Adding New Items
    
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Todo List", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            // what happens when the user is selected
            
            let newItem = Item()
            newItem.title = textField.text!
            self.listArray.append(newItem)
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

