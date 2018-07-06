//
//  ViewController.swift
//  Todoey
//
//  Created by Dara Klein on 7/5/18.
//  Copyright © 2018 Dara Klein. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["lawyer", "Get Cheerios", "Call Bobby", "Pick up prescriptions", "Purified Water", "Bank", "Order Contacts"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
//MARK - TableviewDataSource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        
        return cell
      
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if cell?.accessoryType == .checkmark {
            cell?.accessoryType = .none
        } else {
            cell?.accessoryType = .checkmark
        }
}

}

