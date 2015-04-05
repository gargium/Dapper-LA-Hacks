//
//  FeaturedViewController.swift
//  Dapper
//
//  Created by Gargium on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation
import UIKit

class FeaturedViewController : UIViewController, UITableViewDataSource, TableViewCellDelegate {
    var json : JSON?
    
    @IBOutlet weak var TableView: UITableView!
        override func viewDidLoad() {
        super.viewDidLoad()
        
       // printJSON("front")
        let path = NSBundle.mainBundle().pathForResource("front", ofType: "json")
            if let data = NSData(contentsOfMappedFile: path!) {
                var json : JSON? = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                if json != nil {
                    if let reposArray = json!["results"]["collection1"].array  {
                        for item in reposArray{
                            var name = item["name"]["text"].string
                            var price = item["price"].string
                            var imagePath = item["img"]["src"].string
                            repositories.append(Repository(n: name!, d: price!, i: imagePath!))
                        }
                        
                    }
                }
                
            }
    }
    
//    func printJSON(jsonFileName : String) {
//        if let path = NSBundle.mainBundle().pathForResource(jsonFileName, ofType: "json") {
//            if let data = NSData(contentsOfMappedFile: path) {
//                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
//                println("jsonData:\(json)")
//            }
//        }
//    }
//    
    var repositories = [Repository]()
    
    func toDoItemDeleted(toDoItem: FeaturedCell) {
        let index = (repositories as NSArray).indexOfObject(toDoItem)
        if index == NSNotFound { return }
        
        // could removeAtIndex in the loop but keep it here for when indexOfObject works
        repositories.removeAtIndex(index)
        
        // use the UITableView to animate the removal of this row
        TableView.beginUpdates()
        let indexPathForRow = NSIndexPath(forRow: index, inSection: 0)
        TableView.deleteRowsAtIndexPaths([indexPathForRow], withRowAnimation: .Fade)
        TableView.endUpdates()
    }
    
     func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositories.count
    }
    
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var nameObj = repositories[indexPath.row].name
        var descObj = repositories[indexPath.row].description
        var imgObj = repositories[indexPath.row].imgLoc
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as? FeaturedCell
        let url = NSURL(string: imgObj!)
        println(url)
        let data = NSData(contentsOfURL: url!)
        println()
        println(data)
        if cell != nil && data != nil {
            println(imgObj)
            cell?.selectionStyle = .None
            //cell!.setContents(nameObj!, desc: descObj!, imgData: data!)
            cell!.setContents(nameObj!, desc: "submitted by anonymous user", imgData: data!)
        }

//        }
        cell?.delegate = self
        cell?.FeaturedCellDeleted = cell
        return cell!
    }
    
    func tableView(tableView: UITableView!, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 320
        
    }

    

}
