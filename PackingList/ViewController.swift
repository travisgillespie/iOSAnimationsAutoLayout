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
    @IBOutlet weak var menuHeightConstraint: NSLayoutConstraint!
    
    //MARK: further class variables
    
    var slider: HorizontalItemList!
    var isMenuOpen = false
    var items: [Int] = [5, 6, 7]
    
    //MARK: class methods
    
    @IBAction func actionToggleMenu(sender: UIButton){
        
        for con in titleLabel.superview!.constraints {
            print(" -> \(con.description)\n")
        }
        
        isMenuOpen = !isMenuOpen
        
        for constraint in titleLabel.superview!.constraints {
            if constraint.firstItem as? NSObject == titleLabel &&
                constraint.firstAttribute == .CenterX {
                    constraint.constant = isMenuOpen ? -100.0 : 0.0
                    continue
            }
            
            if constraint.identifier == "TitleCenterY" {
                constraint.active = false
                
                //add new constraint
                let newConstraint = NSLayoutConstraint(
                    item: titleLabel,
                    attribute: .CenterY,
                    relatedBy: .Equal,
                    toItem: titleLabel.superview!,
                    attribute: .CenterY,
                    multiplier: isMenuOpen ? 0.67 : 1.0,
                    constant: 5.0)
                newConstraint.identifier = "TitleCenterY"
                newConstraint.active = true
                
                continue
            }
        }
        
        menuHeightConstraint.constant = isMenuOpen ? 200.0 : 60.0
        titleLabel.text = isMenuOpen ? "Select Item" : "Packing List"
        
        UIView.animateWithDuration(1.0, delay: 0.0,
            usingSpringWithDamping: 0.4, initialSpringVelocity: 10.0,
            options: .CurveEaseIn, animations: {
                self.view.layoutIfNeeded()
                
                let angle = self.isMenuOpen ? CGFloat(M_PI_4) : 0.0
                self.buttonMenu.transform = CGAffineTransformMakeRotation(angle)
            }, completion: nil)
    }
    
    func showItem(index: Int) {
        print("tapped item \(index)")
    }
}

let itemTitles = ["Icecream money", "Great weather", "Beach ball", "Swim suit for him", "Swim suit for her", "Beach games", "Ironing board", "Cocktail mood", "Sunglasses", "Flip flops"]

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    //MARK: View Controller methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView?.rowHeight = 54.0
    }
    
    //MARK: Table View methods
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        cell.accessoryType = .None
        cell.textLabel?.text = itemTitles[items[indexPath.row]]
        cell.imageView?.image = UIImage(named: "summericons_100px_0\(items[indexPath.row]).png")
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        showItem(items[indexPath.row])
    }
}