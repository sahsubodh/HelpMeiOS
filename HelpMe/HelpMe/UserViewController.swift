//
//  ViewController.swift
//  HelpMe
//
//  Created by Subodh Sah on 10/23/15.
//  Copyright © 2015 Subodh Sah. All rights reserved.
//

import UIKit
import Parse
import ParseTwitterUtils


class UserViewController: UIViewController {
  
    @IBOutlet weak var userPhoto: UIImageView!
    
    @IBOutlet weak var usrname: UITextField!
    
    @IBOutlet weak var contactNumber: UITextField!
    
    
    @IBOutlet weak var emercontactName: UITextField!
    
    
    @IBOutlet weak var emercontactNumber: UITextField!
    
    
    @IBAction func updateDetails(sender: AnyObject)
    {
    
        // Checking if user fields are empty.
        if( usrname.text != "" && contactNumber.text != "" && emercontactName.text != ""
            && emercontactNumber.text != ""){
            
            
                var newuser = PFUser.currentUser()!
                
                newuser["usrname"] = usrname.text
                newuser["contactNumber"] = Int(contactNumber.text!)
                newuser["emercontactName"] = emercontactName.text
                newuser["emercontactNumber"] = Int(emercontactNumber.text!)
                
                newuser.saveInBackground()
                
          
        }
        else
        {
                self.displayAlert("Incomplete!",body: "Please enter complete details.")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
      
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //Alert function for pop up alerts.
    func displayAlert(head:String, body:String) {
        let alertController = UIAlertController(title: head, message: body, preferredStyle: .Alert)
        let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in }
        alertController.addAction(OKAction)
        self.presentViewController(alertController, animated: true) { }
        
        
    }
    
    
}

