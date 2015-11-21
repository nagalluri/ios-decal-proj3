//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let api = InstagramAPI()
        api.loadPhotos(didLoadPhotos)
        api.loadPhotos(didLoadPhotos)
        self.collectionView?.backgroundColor = UIColor.whiteColor()
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("ShowImage", sender: indexPath)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "ShowImage") {
            let indexPath = sender as! NSIndexPath
            let photoView = segue.destinationViewController.view as! PhotoView
            if(photos != nil) {
                loadImageForCell(photos[indexPath.row], imageView: photoView.image)
                let formatter = NSDateFormatter()
                formatter.dateStyle = .MediumStyle
                formatter.timeStyle = .MediumStyle
                photoView.postDate.text! += formatter.stringFromDate(photos[indexPath.row].postDate)
                photoView.User.text! += photos[indexPath.row].username
                //photoView.numLikes.text! += photos[indexPath.row].likes.description
                photoView.photo = photos[indexPath.row]
                if(photos[indexPath.row].Liked == false) {
                    photoView.likeButton.setTitle("♡", forState: .Normal)
                } else {
                    photoView.likeButton.setTitle("❤", forState: .Normal)
                }
            }
        }
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("ImageCell", forIndexPath: indexPath) as! ImageCell
        if((photos) != nil){
            dispatch_async(dispatch_get_main_queue()) {
                self.loadImageForCell(self.photos[indexPath.row], imageView: cell.photo)
            }
        }
        cell.photo.sizeToFit()
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if((photos) != nil) {
            return photos.count
        } else {
            return 0
        }
    }
    
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            let screen = UIScreen.mainScreen().bounds.size
            return CGSizeMake(screen.width*0.48, screen.height*0.33)
    }

    
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        let task = NSURLSession.sharedSession().dataTaskWithURL(NSURL(string: photo.url)!) {
            (data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            if error == nil {
                imageView.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos = photos
        self.collectionView!.reloadData()
    }
    
}

