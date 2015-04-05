//
//  FeaturedCell.swift
//  Dapper
//
//  Created by Gargium on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation
import UIKit

// A protocol that the TableViewCell uses to inform its delegate of state change
protocol TableViewCellDelegate {
    // indicates that the given item has been deleted
    func toDoItemDeleted(FeaturedCellDeleted: FeaturedCell)
}

class FeaturedCell : UITableViewCell {

    
@IBOutlet weak var desc_label: UILabel!
@IBOutlet weak var name_label: UILabel!
@IBOutlet weak var brandLogo: UIImageView!
@IBOutlet weak var outfitPicture: UIImageView!
    var originalCenter = CGPoint()
    var deleteOnDragRelease = false
    // The object that acts as delegate for this cell.
    var delegate: TableViewCellDelegate?
    // The item that this cell renders.
    var featureCell: FeaturedCell?
    var isAFavorite = false
    
    
    func setContents(name: String, desc: String, imgData: NSData) {
        name_label.text = name
        desc_label.text = desc
        outfitPicture.image = UIImage (data: imgData)
        
        var recognizer = UIPanGestureRecognizer(target: self, action: "handlePan:")
        recognizer.delegate = self
        addGestureRecognizer(recognizer)
        
        
       // main_image.image = to_put_image
    }
    
    //MARK: - horizontal pan gesture methods
    func handlePan(recognizer: UIPanGestureRecognizer) {
        // 1
        if recognizer.state == .Began {
            // when the gesture begins, record the current center location
            originalCenter = center
        }
        // 2
        if recognizer.state == .Changed {
            let translation = recognizer.translationInView(self)
            center = CGPointMake(originalCenter.x + translation.x, originalCenter.y)
            // has the user dragged the item far enough to initiate a delete/complete?
            deleteOnDragRelease = frame.origin.x < -frame.size.width / 2.0
        }
        // 3
        if recognizer.state == .Ended {
            // the frame this cell had before user dragged it
            let originalFrame = CGRect(x: 0, y: frame.origin.y,
                width: bounds.size.width, height: bounds.size.height)
            if !deleteOnDragRelease {
                // if the item is not being deleted, snap back to the original location
                UIView.animateWithDuration(0.2, animations: {self.frame = originalFrame})
                isAFavorite = true;

            }
            if deleteOnDragRelease {
                if delegate != nil && featureCell != nil {
                    // notify the delegate that this item should be deleted
                    delegate!.toDoItemDeleted(featureCell!)
                }
            }
        }
    }
    
    override func gestureRecognizerShouldBegin(gestureRecognizer: UIGestureRecognizer) -> Bool {
        if let panGestureRecognizer = gestureRecognizer as? UIPanGestureRecognizer {
            let translation = panGestureRecognizer.translationInView(superview!)
            if fabs(translation.x) > fabs(translation.y) {
                return true
            }
            return false
        }
        return false
    }

    

}