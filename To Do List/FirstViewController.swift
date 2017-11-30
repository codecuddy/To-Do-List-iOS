//
//  FirstViewController.swift
//  To Do List
//
//  Created by Charlie Cuddy on 11/28/17.
//  Copyright © 2017 Charlie Cuddy. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableOfItems: UITableView!
    
    var items:[String] = []

    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")

        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        let updatedListObject = UserDefaults.standard.object(forKey: "items")
        
        if let tempItems = updatedListObject as? [String] {
            
            items = tempItems
        }
        
        tableOfItems.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            items.remove(at: indexPath.row)
            
            tableOfItems.reloadData()
            
            UserDefaults.standard.set(items, forKey: "items")

        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

