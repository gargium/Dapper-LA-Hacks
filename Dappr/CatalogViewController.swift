//
//  CatalogViewController.swift
//  Dapper
//
//  Created by Shivam Thapar on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation
import UIKit

class CatalogViewController : UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        printJSON("mens_collection")
    }
    
    func printJSON(jsonFileName : String) {
        if let path = NSBundle.mainBundle().pathForResource(jsonFileName, ofType: "json") {
            if let data = NSData(contentsOfMappedFile: path) {
                let json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
                println("jsonData:\(json)")
            }
        }
    }
}