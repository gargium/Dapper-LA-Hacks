//
//  global.swift
//  Dapper
//
//  Created by Shivam Thapar on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation

class Gender{
    var gender:String
    init(gender:String) {
        self.gender = gender
    }
    func set(gender:String) {
        self.gender = gender
    }
}
class Brand{
    var brand:String
    init(brand:String) {
        self.brand = brand
    }
    func set(brand:String) {
        self.brand = brand
    }
}
class itemType{
    var itemType:String
    init(itemType:String)
    {
        self.itemType = itemType
    }
    func set(itemType:String) {
        self.itemType = itemType
    }
}
var globalGender = Gender(gender:"null")
var globalBrand = Brand(brand:"null")
var globalItemType = itemType(itemType:"null")
    