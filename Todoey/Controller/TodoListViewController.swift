//
//  ViewController.swift
//  Todoey
//
//  Created by Luiz Santos on 7/17/18.
//  Copyright © 2018 Luiz Santos. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArray = [Items]()
    let defaults = UserDefaults.standard
    @IBOutlet var itemsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let newItem1 = Items()
        newItem1.title = "Find Mike"
        itemArray.append(newItem1)
        
        let newItem2 = Items()
        newItem2.title = "Buy Eggos"
        itemArray.append(newItem2)
        
        let newItem3 = Items()
        newItem3.title = "Destroy Demogorgon"
        itemArray.append(newItem3)
        
        if let items = defaults.array(forKey: "ToDoListArray") as? [Items] {
            itemArray = items
        }
        
        //Set the tapGesture here:
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
//        messageTableView.addGestureRecognizer(tapGesture)
        
        
        //Register the CustomCell.xib file here:
        itemsTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "customCell")
        
        
    }


    //MARK - Tableview Datasource Methods
    
    //Declare cellForRowAtIndexPath here:
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomCell
        cell.cellBackground.backgroundColor = UIColor.white
        cell.cellLabel.text = itemArray[indexPath.row].title
        //Ternary
        cell.accessoryType = itemArray[indexPath.row].done == true ? .checkmark : .none
        return cell
    }
    
    
    //Declare numberOfRowsInSection here:
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section : Int) -> Int {
        return itemArray.count
    }
    
    
//    //Declare tableViewTapped here:
//    @objc func tableViewTapped() {
//        messageTextfield.endEditing(true)
//    }
//
//
//    //Declare configureTableView here:
//    func configureTableView() {
//        messageTableView.rowHeight = UITableViewAutomaticDimension
//        messageTableView.estimatedRowHeight = 120
//    }
    
    //MARK - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        self.tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add items to list
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add item", style: .default) { (action) in
            if textField.text != nil {
                let newItem = Items()
                newItem.title = textField.text!
                self.itemArray.append(newItem)
                self.defaults.set(self.itemArray, forKey: "ToDoListArray")
                self.tableView.reloadData()
            }
        }
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Type new item"
            textField = alertTextField
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    
}

