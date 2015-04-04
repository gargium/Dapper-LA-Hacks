//
//  ViewController.swift
//  Dappr
//
//  Created by Gargium on 4/3/15.
//  Copyright (c) 2015 rakshitgarg. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //login field outlets
    @IBOutlet weak var lgUserField: UITextField!
    @IBOutlet weak var lgPassField: UITextField!
    @IBOutlet weak var lgButton: UIButton!
    @IBOutlet weak var lgGo: UIButton!
    
    @IBOutlet weak var accButton: UIButton!
    @IBOutlet weak var accEmailField: UITextField!
    @IBOutlet weak var accPassField: UITextField!
    @IBOutlet weak var accUserField: UITextField!
    @IBOutlet weak var accConfirmPassField: UITextField!
    @IBOutlet weak var accGo: UIButton!
    
    //login actions
    @IBAction func lgPressed(sender: AnyObject) {
        lgPassField.hidden = false
        lgUserField.hidden = false
        lgGo.hidden = false
    }
    
    //account actions
    @IBAction func accPressed(sender: AnyObject) {
        accEmailField.hidden = false
        accUserField.hidden = false
        accConfirmPassField.hidden = false
        accPassField.hidden = false
        accGo.hidden = false
        lgGo.hidden = true
    }
    
    @IBAction func accGoPressed(sender: AnyObject) {
        lgGo.hidden = true
        if (accConfirmPassField.text != accPassField.text) {
            var alert = UIAlertController(title: "Error", message: "Passwords do not match!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Redo", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "init.png")!)
        lgUserField.hidden = true
        lgPassField.hidden = true
        lgGo.hidden = true
        accEmailField.hidden = true
        accUserField.hidden = true
        accConfirmPassField.hidden = true
        accPassField.hidden = true
        accGo.hidden = true
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

