//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
    /* The username of the photographer. */
    var username : String!
    var Liked: Bool
    var postDate: NSDate!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN
        // HINT: use nested .valueForKey() calls, and then cast using 'as! TYPE'
        let image = (data.valueForKey("images") as! NSDictionary!).valueForKey("standard_resolution") as! NSDictionary
        url = image.valueForKey("url") as! String!
        let timestamp = (data.valueForKey("created_time")) as! String
        
        username = (data.valueForKey("user") as! NSDictionary).valueForKey("username") as! String!
        postDate = NSDate(timeIntervalSince1970: Double(timestamp)!)
        Liked = false
    }

}