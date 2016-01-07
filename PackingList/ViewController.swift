//
//  ViewController.swift
//  PackingList
//
//  Created by Travis Gillespie on 12/27/15.
//  Copyright © 2015 Travis Gillespie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IB outlets
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var buttonMenu: UIButton!
    @IBOutlet var titleLabel: UILabel!
    
    //MARK: further class variables
    

    
    //MARK: class methods
    
    @IBAction func actionToggleMenu(sender: UIButton){
        
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: View Controller methods
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    //MARK: Table View methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        return cell
    }
}