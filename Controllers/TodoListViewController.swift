//
//  ViewController.swift
//  Todoey
//
//  Created by Dara Klein on 7/5/18.
//  Copyright © 2018 Dara Klein. All rights reserved.

import UIKit
class TodoListViewController: UITableViewController {
    var itemArray = [Item]()
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()

       let newItem1 = Item()
        newItem1.title = "Find Mike"
        newItem1.done = true
        itemArray.append(newItem1)
        
        
        let newItem2 = Item()
        newItem2.title = "buy cheerios"
        itemArray.append(newItem2)
        
        
        let newItem3 = Item()
        newItem3.title = "buy wine"
        itemArray.append(newItem3)
    }
//MARK - TableviewDataSource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("cellForRowAtindexPath called")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        //to avoid such repetition
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.title
        
        //ternary operator ==>
        //value = condition ? valueIfTrue : valueIfFalse
        
        cell.accessoryType = item.done ? .checkmark : .none
        
        return cell
    }
    
    //MARK - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    itemArray[indexPath.row].done = !itemArray[indexPath.row].done
       
    tableView.reloadData()
     
    tableView.deselectRow(at: indexPath, animated: true)
}
    
    //MARK - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        //initialize to empty UITextField Object
        let textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//what will happen once the user clicks the Add Item button on our UIAlert
            
            let newItem = Item()
            newItem.title = textField.text!
          //NOTE- broke after adding data model, added the two lines above
            self.itemArray.append(newItem)
        
            //Persist Data locally -
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
            //Reload Data onto TableView
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField.text = (alertTextField.text)
            print("Not What you'd expect timewise, huh?")
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

