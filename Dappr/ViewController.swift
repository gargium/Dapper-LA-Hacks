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
    @IBOutlet weak var accConfirmPassField: UITextField!
    @IBOutlet weak var accGo: UIButton!
    
    //login actions
    @IBAction func lgPressed(sender: AnyObject) {
        lgPassField.hidden = false
        lgUserField.hidden = false
        lgGo.hidden = false
        let json = JSON(["name", "age"])
    }
    
    @IBAction func lgGoPressed(sender: AnyObject) {
        if (lgUserField.text.isEmpty || lgPassField.text.isEmpty) {
            var alert = UIAlertController(title: "Error", message: "All fields must be filled", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
            //check to make sure pass fields match
        else {
            PFUser.logInWithUsernameInBackground(lgUserField.text, password:lgPassField.text) {
                (user: PFUser!, error: NSError!) -> Void in
                if user != nil {
                    self.performSegueWithIdentifier("titleToTab", sender: self)
                } else {
                    var alert = UIAlertController(title: "Error", message: "A user matching this username and password was not found in our system", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                }
            }
        }

    }
    //account actions
    @IBAction func accPressed(sender: AnyObject) {
        accEmailField.hidden = false
        accConfirmPassField.hidden = false
        accPassField.hidden = false
        accGo.hidden = false
        lgGo.hidden = true
    }
    
    @IBAction func accGoPressed(sender: AnyObject) {
        lgGo.hidden = true
        if (accEmailField.text.isEmpty || accPassField.text.isEmpty || accConfirmPassField.text.isEmpty) {
            var alert = UIAlertController(title: "Error", message: "All fields must be filled", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        //check to make sure pass fields match
        else if (accConfirmPassField.text != accPassField.text) {
            var alert = UIAlertController(title: "Error", message: "Passwords do not match!", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            createAcc()
        }
        
        //no bools triggered
    }
    
    
    func createAcc() {
        var newUser = PFUser()
        newUser.email = accEmailField.text
        newUser.password = accConfirmPassField.text
        newUser.username = accEmailField.text
        
        newUser.signUpInBackgroundWithBlock {
            (succeeded: Bool!, error: NSError!) -> Void in
            if error == nil {
                self.performSegueWithIdentifier("titleToTab", sender: self)
            } else {
                // Show the errorString somewhere and let the user try again.
                var alert = UIAlertController(title: "Error", message: error.description, preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "init2.png")!)
        lgUserField.hidden = true
        lgPassField.hidden = true
        lgGo.hidden = true
        accEmailField.hidden = true
        accConfirmPassField.hidden = true
        accPassField.hidden = true
        accGo.hidden = true
        lgButton.hidden = false
        accButton.hidden = false
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

