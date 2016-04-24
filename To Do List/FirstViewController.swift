//
//  FirstViewController.swift
//  To Do List
//
//  Created by Michael Avnyin on 2/1/16.
//  Copyright © 2016 Michael Avnyin. All rights reserved.
//

import UIKit

var listArray = [String]()
let colorArray = [UIColor.lightGrayColor(),UIColor.yellowColor()]

class FirstViewController: UIViewController, UITableViewDelegate {

    @IBOutlet var tableList: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return listArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = listArray[indexPath.row]
        
        cell.textLabel!.font = UIFont(name: "Avenir", size:23)
        
        if(indexPath.row % 2 == 0){
            cell.backgroundColor = UIColor(red: 0.16, green: 0.50, blue: 1, alpha: 1)//colorArray[0]
            cell.textLabel!.textColor = UIColor.orangeColor()
        }
        else{
            cell.backgroundColor = UIColor(red: 0.16, green: 0.50, blue: 1, alpha: 0.5)//colorArray[1]
            cell.textLabel!.textColor = UIColor.whiteColor()
        }
    
        return cell
        
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            listArray.removeAtIndex(indexPath.row)
            
            NSUserDefaults.standardUserDefaults().setObject(listArray, forKey: "listArray")
            
            tableList.reloadData()
            
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        tableList.reloadData()
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if  NSUserDefaults.standardUserDefaults().objectForKey("listArray") != nil {
            listArray = NSUserDefaults.standardUserDefaults().objectForKey("listArray") as! [String]
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

