//
//  ViewController.swift
//  HelpMe
//
//  Created by Subodh Sah on 10/23/15.
//  Copyright © 2015 Subodh Sah. All rights reserved.
//

import UIKit
import Parse
import MapKit
import CoreLocation
import QuartzCore


class ProfileViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var emergencyText: UITextView!
    @IBOutlet weak var locationtext: UITextView!
    @IBOutlet weak var phonetext: UITextView!
    
    var currentLocation:PFGeoPoint!
    var currentUser:PFUser = PFUser.currentUser()!

    
    let locationManager = CLLocationManager()
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
            emergencyText!.layer.borderWidth = 1
            emergencyText!.layer.borderColor = UIColor.redColor().CGColor
            
            
            
            startLocationManager()
            
         //handle mobile number as optional chaining case
            

            
            if let phoneNumber = PFUser.currentUser()?["contactNumber"] as? Int {
                
                var strphone = String(phoneNumber)
                
                //print("Your Phone Number is: = \(strphone)");
                
                phonetext.text = "Your Phone Number is: \(strphone)"
            
            }
            
            
            
        self.locationManager.stopUpdatingLocation()
            
            
    }
    
    
    func startLocationManager() {
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        
        // Check if the user allowed authorization
        if   (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.Authorized)
        {
            
          //  print(locationManager.location!.coordinate.latitude)
           // print(locationManager.location!.coordinate.longitude)
            
            locationtext.text = "Your Location is Latitude: \(locationManager.location!.coordinate.latitude), Longitude:  \(locationManager.location!.coordinate.longitude)"

            
        }  else {
            //labelLatitude.text = "Location not authorized"
            locationtext.text = "Please Wait till we get your location"
        }
    }

    

    @IBAction func logout(sender: AnyObject) {
        
            
            PFUser.logOutInBackgroundWithBlock({(error) -> Void in
                print("error in logging out")
            })
            
            exit(0)
    }
    
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Errors: " + error.localizedDescription)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

