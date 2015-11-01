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
  
    
    @IBOutlet weak var contactNumber: UITextField!
    @IBOutlet weak var usrname: UITextField!
    
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
        if( usrname.text != "" && contactNumber.text != ""){
            
            let newuser = PFUser()
           
            newuser["username"] = usrname.text
            newuser["contactNumber"] = Int(contactNumber.text!)
            newuser["password"] = contactNumber.text
            
            newuser.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
                if (succeeded) {
                    //if succesful move to next segue
                    self.performSegueWithIdentifier(self.toMain, sender: nil)
                    
                } else {
                    //self.displayAlert("Error!", body: "Registration Failed")
                    
                }
            }

              newuser.saveInBackground()

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

