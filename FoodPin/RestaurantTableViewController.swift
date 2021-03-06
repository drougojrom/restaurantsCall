//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by Roman Ustiantcev on 04/05/16.
//  Copyright © 2016 Roman Ustiantcev. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    // MARK: - instance variables
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "G/F, 72 Po Hing Fong, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "cafedeadend.jpg", isVisited: false),
        Restaurant(name: "Homei", type: "Cafe", location: "Shop B, G/F, 22-24A Tai Ping San Street SOHO, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "homei.jpg", isVisited: false),
        Restaurant(name: "Teakha", type: "Tea House", location: "Shop B, 18 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "teakha.jpg", isVisited: false),
        Restaurant(name: "Cafe Loisl", type: "Austrian / Causual Drink", location: "Shop B, 20 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "cafeloisl.jpg", isVisited: false),
        Restaurant(name: "Petite Oyster", type: "French", location: "24 Tai Ping Shan Road SOHO, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "petiteoyster.jpg", isVisited: false),
        Restaurant(name: "For Kee Restaurant", type: "Cafe", location: "Shop J-K., 200 Hollywood Road, SOHO, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "forkeerestaurant.jpg", isVisited: false),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "G/F, 62 Po Hing Fong, Sheung Wan, Hong Kong", telephoneNumber: "123829139", image: "posatelier.jpg", isVisited: false),
        Restaurant(name: "Bourke Street Bakery", type: "Bakery", location: "633 Bourke St Sydney New South Wales 2010 Surry Hills", telephoneNumber: "123829139", image: "bourkestreetbakery.jpg", isVisited: false),
        Restaurant(name: "Haighs Chocolate", type: "Chocolate", location: "412-414 George St Sydney New South Wales", telephoneNumber: "123829139", image: "haighschocolate.jpg", isVisited: false),
        Restaurant(name: "Palomino Espresso", type: "Cafe", location: "Shop 1 61 York St Sydney New South Wales", telephoneNumber: "123829139", image: "palominoespresso.jpg", isVisited: false),
        Restaurant(name: "Upstate", type: "American / Seafood", location: "95 1st Ave New York, NY 10003", telephoneNumber: "123829139", image: "upstate.jpg", isVisited: false),
        Restaurant(name: "Traif", type: "American", location: "229 S 4th St Brooklyn, NY 11211", telephoneNumber: "123829139", image: "traif.jpg", isVisited: false),
        Restaurant(name: "Waffle Wolf", type: "American", location: "445 Graham Ave Brooklyn, NY 11211", telephoneNumber: "123829139", image: "wafflewolf.jpg", isVisited: false),
        Restaurant(name: "Five leaves", type: "American", location:  "413 Graham Ave Brooklyn, NY 11211", telephoneNumber: "123829139", image: "fiveleaves.jpg", isVisited: false),
        Restaurant(name: "Cafe Lore", type: "Breakfast & Brunch", location: "Sunset Park 4601 4th Ave Brooklyn, NY 11220", telephoneNumber: "123829139", image: "cafelore.jpg", isVisited: false),
        Restaurant(name: "Donostia", type: "British", location: "10 Seymour Place London W1H 7ND United Kingdom", telephoneNumber: "123829139", image: "donostia.jpg", isVisited: false),
        Restaurant(name: "Confessional", type: "Spanish", location: "308 E 6th St New York, NY 10003", telephoneNumber: "123829139", image: "confessional.jpg", isVisited: false),
        Restaurant(name: "Barrafina", type: "British", location: "54 Frith Street London W1D 4SL United Kingdom", telephoneNumber: "123829139", image: "barrafina.jpg", isVisited: false),
        Restaurant(name: "Royal Oak", type: "Thai", location: "2 Regency Street London SW1P 4BZ United Kingdom", telephoneNumber: "123829139", image: "royaloak.jpg", isVisited: false)
    
    ]
    
    var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)
    var restaurantIsVisitedTitle = Bool()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.hidesBarsOnSwipe = true
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurants.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell

        cell.nameLabel.text = restaurants[indexPath.row].name
        
        cell.thumbnailImageView.image = UIImage(named: restaurants[indexPath.row].image)
        cell.thumbnailImageView.layer.cornerRadius = 30.0
        cell.thumbnailImageView.clipsToBounds = true
        
        cell.typeLabel.text = restaurants[indexPath.row].type
        cell.locationLabel.text = restaurants[indexPath.row].location
        
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .Checkmark : .None
        
        return cell
    }
    
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
//        
//        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
//        let callActionHandler = {(action: UIAlertAction) -> Void in
//            let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, you can't call yet. Please try again later", preferredStyle: .Alert)
//            alertMessage.addAction(UIAlertAction(title: "Ok", style: .Default, handler: nil))
//            self.presentViewController(alertMessage, animated: true, completion: nil)
//        }
//        
//        let callAction = UIAlertAction(title: "Call " + "123-00-\(indexPath.row)", style: .Default, handler: callActionHandler)
//        
//        let title: String = {
//            if restaurantIsVisitedTitle == false {
//                restaurantIsVisitedTitle = true
//                return "I've been there"
//            } else {
//                restaurantIsVisitedTitle = false
//                return "I've not been there"
//            }
//        }()
//        
//        let isVisitedAction = UIAlertAction(title: title, style: .Default, handler: {
//            (action: UIAlertAction) -> Void in
//            let cell = tableView.cellForRowAtIndexPath(indexPath)
//            if cell?.accessoryType != .Checkmark {
//                cell?.accessoryType = .Checkmark
//                self.restaurantIsVisited[indexPath.row] = true
//            } else if cell?.accessoryType == .Checkmark {
//                    cell?.accessoryType = .None
//                    self.restaurantIsVisited[indexPath.row] = false
//            }
//        })
//        
//        optionMenu.addAction(isVisitedAction)
//        optionMenu.addAction(callAction)
//        optionMenu.addAction(cancelAction)
//        
//        self.presentViewController(optionMenu, animated: true, completion: nil)
//        
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            restaurants.removeAtIndex(indexPath.row)
        }
        
        
        tableView.reloadData()
        
    }
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        // social sharing 
        let shareAction = UITableViewRowAction(style: .Default, title: "Share", handler: { (action, indexPath) -> Void in
            
            let defaultText = "Just checking in at " + self.restaurants[indexPath.row].name
            
            if let imageToShare = UIImage(named: self.restaurants[indexPath.row].image) {
                let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
                self.presentViewController(activityController, animated: true, completion: nil)
            }
            
            let activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            
            self.presentViewController(activityController, animated: true, completion: nil)
        })
        
        let deleteAction = UITableViewRowAction(style: .Default, title: "Delete", handler: { (action, indexPath) -> Void in
            
            self.restaurants.removeAtIndex(indexPath.row)
            
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        })
        
        shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
        deleteAction.backgroundColor = UIColor(red: 202.0/255.0, green: 202.0/255.0, blue: 203.0/255.0, alpha: 1.0)
        
        return [deleteAction, shareAction]
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if segue.identifier == "showRestaurantImage" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let destinationController = segue.destinationViewController as! RestaurantDetailViewController
                destinationController.restaurant = restaurants[indexPath.row]
            }
        }
        
        
    }
    

}
