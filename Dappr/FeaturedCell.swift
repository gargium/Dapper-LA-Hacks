//
//  FeaturedCell.swift
//  Dapper
//
//  Created by Gargium on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation
import UIKit

class FeaturedCell : UITableViewCell {

    
@IBOutlet weak var desc_label: UILabel!
@IBOutlet weak var name_label: UILabel!
@IBOutlet weak var brandLogo: UIImageView!
@IBOutlet weak var outfitPicture: UIImageView!
    
    func setContents(name: String, desc: String, imgData: NSData) {
        name_label.text = name
        desc_label.text = desc
        outfitPicture.image = UIImage (data: imgData)
       // main_image.image = to_put_image
    }

}