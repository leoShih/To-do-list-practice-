//
//  FirstViewController.swift
//  To do list(practice)
//
//  Created by Leo on 25/11/2017.
//  Copyright © 2017 Leo. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var items:[String] = [] //initially array
    
    @IBOutlet var table: UITableView!
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return items.count
        
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        cell.textLabel?.text = items[indexPath.row] //to grab items array
        
        return cell
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        //check to see if there are object in "itemsObject" ，if have value:
        if let itemsObject = itemsObject as? [String] {
            
            items = itemsObject
            
        }
        
        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.delete {
            
            items.remove(at: indexPath.row)
            
            table.reloadData() //delete items need to refresh tableview
            
            UserDefaults.standard.set(items, forKey: "items") //delect items and save data, if not save date the ietms alway be there.
            
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

