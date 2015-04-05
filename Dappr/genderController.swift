//
//  genderController.swift
//  Dapper
//
//  Created by Shivam Thapar on 4/4/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import Foundation
import UIKit

class genderController:UIViewController
{
    
    
    @IBAction func femaleButton(sender: AnyObject) {
        globalGender.set("womens")
        self.performSegueWithIdentifier("genderToFemaleBrand", sender: self)
    }
    @IBAction func maleButton(sender: AnyObject) {
        globalGender.set("mens")
        self.performSegueWithIdentifier("genderToMaleBrand", sender: self)
    }
}

class mBrandController:UIViewController
{
    @IBAction func male_gap(sender: AnyObject) {
        globalBrand.set("gap")
        self.performSegueWithIdentifier("m_brandtotype", sender: self)
        println("got here")
    }
    
    @IBAction func male_oldnavy(sender: AnyObject) {
        globalBrand.set("OldNavy")
        self.performSegueWithIdentifier("m_brandtotype", sender: self)
    }
    
    @IBAction func male_bananaRepublic(sender: AnyObject) {
        globalBrand.set("bananaRepublic")
        self.performSegueWithIdentifier("m_brandtotype", sender: self)
    }
    
}

class mTypeController:UIViewController
{
    @IBAction func male_pants(sender: AnyObject) {
        globalItemType.set("khakis")
        self.performSegueWithIdentifier("mTypeToCatalog", sender: self)
    }
    @IBAction func male_shorts(sender: AnyObject) {
        globalItemType.set("shorts")
        self.performSegueWithIdentifier("mTypeToCatalog", sender: self)
    }
    @IBAction func male_polos(sender: AnyObject) {
        globalItemType.set("polos")
        self.performSegueWithIdentifier("mTypeToCatalog", sender: self)
    }
    @IBAction func male_shoes(sender: AnyObject) {
        globalItemType.set("shoes")
        self.performSegueWithIdentifier("mTypeToCatalog", sender: self)
    }
    
    
}

class fBrandController:UIViewController
{
    @IBAction func female_gap(sender: AnyObject) {
        globalBrand.set("gap")
    self.performSegueWithIdentifier("f_brandtotype", sender: self)
    }
    @IBAction func female_oldnavy(sender: AnyObject) {
        globalBrand.set("OldNavy")
        self.performSegueWithIdentifier("f_brandtotype", sender: self)
    }
    @IBAction func female_banRep(sender: AnyObject) {
        globalBrand.set("bananaRepublic")
        self.performSegueWithIdentifier("f_brandtotype", sender: self)
    }
    @IBAction func female_piperlime(sender: AnyObject) {
        globalBrand.set("piperLine")
        self.performSegueWithIdentifier("f_brandtotype", sender: self)
    }
    
    
}

class fTypeController:UIViewController
{
    
    @IBAction func f_jeans(sender: AnyObject) {
        globalItemType.set("jeans")
        self.performSegueWithIdentifier("fTypeToCatalog", sender: self)
    }
    @IBAction func f_skirts(sender: AnyObject) {
        globalItemType.set("skirts")
        self.performSegueWithIdentifier("fTypeToCatalog", sender: self)
    }
    @IBAction func f_tops(sender: AnyObject) {
        globalItemType.set("blouses")
        self.performSegueWithIdentifier("fTypeToCatalog",
            sender: self)
    }
    @IBAction func f_shoes(sender: AnyObject) {
        globalItemType.set("shoes")
        self.performSegueWithIdentifier("fTypeToCatalog", sender: self)
    }
    
    
    
}