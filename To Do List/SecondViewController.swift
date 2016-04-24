//
//  SecondViewController.swift
//  To Do List
//
//  Created by Michael Avnyin on 2/1/16.
//  Copyright © 2016 Michael Avnyin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var newItem: UITextField!
    
    @IBAction func addToList(sender: AnyObject) {
        
        listArray.append("\(listArray.count+1)) "+newItem.text!)
        
        newItem.text = ""
    
        NSUserDefaults.standardUserDefaults().setObject(listArray, forKey: "listArray")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        
        newItem.resignFirstResponder()
        return true
        
        
    }

}

