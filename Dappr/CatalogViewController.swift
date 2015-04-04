//
//  CatalogViewController.swift
//  Dapper
//
//  Created by Shivam Thapar on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation
import UIKit

class CatalogViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    @IBOutlet var collectionView: UICollectionView?
    var json: JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 70, left: 5, bottom: 10, right: 5)
        layout.itemSize = CGSize(width: 202, height: 270)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView!.dataSource = self
        collectionView!.delegate = self
        collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
        collectionView!.backgroundColor = UIColor.whiteColor()
        fetchJSON("mens_collection")
        if json != nil{
            printJSON()
        }
        self.view.addSubview(collectionView!)
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // number of elems
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
        cell.backgroundColor = UIColor.blackColor()
        cell.textLabel?.text = "\(indexPath.section):\(indexPath.row)"
        cell.imageView?.image = UIImage(named: "circle")
        return cell
    }
    
    func fetchJSON(jsonFileName : String){
        if let path = NSBundle.mainBundle().pathForResource(jsonFileName, ofType: "json") {
            if let data = NSData(contentsOfMappedFile: path) {
                self.json = JSON(data: data, options: NSJSONReadingOptions.AllowFragments, error: nil)
            }
        }
    }
    
    func printJSON() {
        if let items = self.json!["mens"]["OldNavy"]["khakis"].array{
            for item in items{
                //println(item["price"].string)
            }
        }
    }
}