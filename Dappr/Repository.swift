//
//  Repository.swift
//  Dapper
//
//  Created by Gargium on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import UIKit

class Repository {
    
    var name: String?
    var description: String?
    var imgLoc: String?
    init(n : String, d : String, i: String) {
        self.name = n
        self.description = d
        self.imgLoc = i
}
}
