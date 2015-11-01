import Foundation
import Parse
import UIKit


//how to create a global variable
class Userdetails : PFObject {
    //how to save and get the current user information
    //var usrname:String!
    //var contactNumber:String!
    //var emercontactNumber:String!
    //var image:UIImage!
    
    @NSManaged var usrname: String?
    @NSManaged var contactNumber: String?
    @NSManaged var emercontactName: String?
    @NSManaged var emercontactNumber: String?
    @NSManaged var PersonalPhoto: UIImage?
  
    override init() {
        super.init()
    }
    

    override class func initialize() {
        var onceToken: dispatch_once_t = 0
        dispatch_once(&onceToken) {
            self.registerSubclass()
        }
    }
    
    init(usrname:String,contactNumber:String,emercontactName:String,emercontactNumber:String,PersonalPhoto:UIImage) {
        super.init()
        self.usrname=usrname
        self.contactNumber=contactNumber
        self.emercontactName=emercontactName
        self.emercontactNumber=emercontactNumber
        self.PersonalPhoto=PersonalPhoto
    }
}
//var userInstance = Userdetails(usrname:"dummy",contactNumber:"dummy",emercontactName:"dummy",emercontactNumber:"dummy")