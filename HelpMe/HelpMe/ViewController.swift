//
//  ViewController.swift
//  HelpMe
//
//  Created by Subodh Sah on 10/23/15.
//  Copyright © 2015 Subodh Sah. All rights reserved.
//

import UIKit
import Parse



class ViewController: UIViewController, PFLogInViewControllerDelegate {
  
    
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var contactNumber: UITextField!

    @IBOutlet weak var lastname: UITextField!
    
    @IBOutlet weak var address: UITextField!
    
    
    @IBOutlet weak var zipcode: UITextField!
    
    @IBOutlet weak var state: UITextField!
    
    @IBOutlet weak var emercontactName: UITextField!
    
    @IBOutlet weak var emercontactNumber: UITextField!
    
    
    var toMain = "toMain"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func saveandcontinue(sender: AnyObject) {
        
        // Checking if user fields are empty.
        if( firstname.text != "" && lastname.text != "" && contactNumber.text != "" && address.text != "" && zipcode.text != "" && state.text != "" && emercontactName.text != "" && emercontactNumber.text != "" && contactNumber.text != ""){
            
            let newuser = PFUser()
           
            newuser["username"] = firstname.text
            newuser["lastname"] = lastname.text
            newuser["contactNumber"] = Int(contactNumber.text!)
            newuser["address"] = address.text
            newuser["zipcode"] = Int(zipcode.text!)
            newuser["state"] = state.text
            newuser["emercontactName"] = emercontactName.text
            newuser["emercontactNumber"] = Int(emercontactNumber.text!)
            newuser["password"] = contactNumber.text
            
            newuser.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
                if (succeeded) {
                    //if succesful move to next segue
            self.performSegueWithIdentifier(self.toMain, sender: nil)
                    
                } else {
                    self.displayAlert("Error!", body: "Registration Failed")
                    
                }
            }

        }
        else
        {
            self.displayAlert("Incomplete!",body: "Please enter complete details.")
        }

    }
   
    
    //Alert function for pop up alerts.
    func displayAlert(head:String, body:String) {
        let alertController = UIAlertController(title: head, message: body, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true) { }
        
    }
 
}

