//
//  InitialViewController.swift
//  HelpMe
//
//  Created by Subodh Sah on 11/2/15.
//  Copyright © 2015 Subodh Sah. All rights reserved.
//


import UIKit
import Parse

class InitialViewController: UIViewController {
    
    override func viewDidAppear(animated: Bool) {
        if let _ = PFUser.currentUser() {
            print("hello " + PFUser.currentUser()!.username!)
            self.performSegueWithIdentifier("toHelp", sender: self)
        } else {
            self.performSegueWithIdentifier("toRegister", sender: self)
        }
    }
}
