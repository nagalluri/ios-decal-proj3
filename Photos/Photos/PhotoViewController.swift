//
//  PhotoViewController.swift
//  Photos
//
//  Created by Nag Alluri on 11/20/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {
    var photo: Photo?
    @IBOutlet weak var numLikes: UILabel!
    @IBOutlet weak var User: UILabel!
    @IBOutlet weak var postDate: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBAction func likedButtonPressed(sender: AnyObject) {
        if(photo?.Liked == false) {
            likeButton.setTitle("❤", forState: .Normal)
        } else {
            likeButton.setTitle("♡", forState: .Normal)
        }
        photo?.Liked = !photo!.Liked
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
