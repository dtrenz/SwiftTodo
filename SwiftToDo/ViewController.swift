//
//  ViewController.swift
//  SwiftToDo
//
//  Created by Dan Trenz on 6/3/14.
//  Copyright (c) 2014 Detroit Labs. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UITableViewDataSource {
    
    var rows: String[] = String[]() {
        didSet {
           tableView.reloadData()
        }
    }
    
    @IBOutlet var addButton: UIBarButtonItem
    
    override func viewDidLoad() {
        tableView.allowsMultipleSelectionDuringEditing = false
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }

    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell") as UITableViewCell
        cell.text = rows[indexPath.row]
        return cell
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            rows.removeAtIndex(indexPath.row)
        }
    }
    
    @IBAction func didTapAddButton(sender: UIBarButtonItem) {
        let addItemAlert = UIAlertController(title: "Add Item", message: "Add a new ToDo item", preferredStyle: .Alert)
        
        let itemAlertAction = UIAlertAction(title: "Add", style: .Default) {
            [weak self] (action) in // do i need weak self here?
            self!.addItem(addItemAlert.textFields[0].text)
        }
        
        addItemAlert.addAction(itemAlertAction)
        addItemAlert.addTextFieldWithConfigurationHandler(nil)
        
        presentViewController(addItemAlert, animated: true, completion: nil)
    }
    
    func addItem(text: String) {
        rows += text
    }
    
}
