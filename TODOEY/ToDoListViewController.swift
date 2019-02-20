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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    // Mark  // Table View Delegate Methods //
    
    
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

}

