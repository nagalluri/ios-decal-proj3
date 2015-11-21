//
//  PhotoView.swift
//  Photos
//
//  Created by Nag Alluri on 11/21/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoView: UIView {
    
    @IBOutlet weak var numLikes: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var User: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var image: UIImageView!
    var photo: Photo?
    @IBAction func likeButtonPressed(sender: AnyObject) {
        if(photo?.Liked == false) {
            likeButton.setTitle("❤", forState: .Normal)
        } else {
            likeButton.setTitle("♡", forState: .Normal)
        }
        photo?.Liked = !photo!.Liked
    }

}
