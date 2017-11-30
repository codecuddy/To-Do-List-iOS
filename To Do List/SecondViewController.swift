//
//  SecondViewController.swift
//  To Do List
//
//  Created by Charlie Cuddy on 11/28/17.
//  Copyright © 2017 Charlie Cuddy. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var newItem: UITextField!
    
    @IBAction func addItem(_ sender: Any) {
        
        let updatedListObject = UserDefaults.standard.object(forKey: "items")
        
        var items:[String]
        
        if let tempItems = updatedListObject as? [String] {
            
            items = tempItems
            
            items.append(newItem.text!)
            
        } else {

            items = [newItem.text!]
            
        }
        
        UserDefaults.standard.set(items, forKey: "items")
        newItem.text = ""
    }
    
    // get rid of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //bring keyboard back
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

