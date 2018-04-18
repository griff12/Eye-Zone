//
//  HomeworkViewController.swift
//  Eye Zone
//
//  Created by Griffin Christenson on 4/17/18.
//  Copyright © 2018 Eye Zone. All rights reserved.
//

import UIKit
import RealmSwift

class HomeworkViewController: UITableViewController {

    
    var homeworkItems: Results<Item>?
    let realm = try! Realm()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        loadItems()
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeworkItemCell", for: indexPath)
        
        if let item = homeworkItems?[indexPath.row] {
            
            cell.textLabel?.text = item.title
            
            // Ternary Operator ==>
            // value = condition ? valueIfTrue : valueIfFalse
            
            cell.accessoryType = item.done ? .checkmark : .none
        } else {
            cell.textLabel?.text = "No Items Added"
        }
        
        
        return cell
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeworkItems?.count ?? 1
    }
    
    //MARK: - TableView Delegate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
//        do {
//            if let item = homeworkItems?[indexPath.row] {
//            try self.realm.write {
//                item.done = !item.done
//                self.realm.add(item, update: item.done)
//            }
//        }
//
//        } catch {
//            print("Error saving new items, \(error)")
//        }
        //      Order Matters Here
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        //
        //        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK: - Add New Item
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New List It Homework Item", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What will happen once user clicks the addButton on our UIAlert
            
            
            if textField.text != "" {
                do {
                    try self.realm.write {
                        let newItem = Item()
                        newItem.title = textField.text!
                        newItem.done = false
                        self.realm.add(newItem)
                    }
                } catch {
                    print("Error saving new items, \(error)")
                }
            }
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create New Item"
            textField = alertTextField
        }
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    func loadItems() {
        
        homeworkItems = realm.objects(Item.self)
        
        tableView.reloadData()
    }
}
