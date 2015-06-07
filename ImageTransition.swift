//
//  ImageTransition.swift
//  FacebookFeed
//
//  Created by Rebecca Goldman on 6/4/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class ImageTransition: BaseTransition {
    
    
    var feedViewController: FeedViewController!
    var photoViewController: PhotoViewController!

    
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        println("Why isn't this working, dammit!?")
        
        feedViewController = fromViewController as! FeedViewController
        photoViewController = toViewController as! PhotoViewController
        
        var destinationImageFrame = photoViewController.imageView.frame
        photoViewController.imageView.frame = feedViewController.selectedImageView.frame
        
        
        toViewController.view.alpha = 0
        UIView.animateWithDuration(0.3, animations: {
            
            toViewController.view.alpha = 1
            
            self.photoViewController.imageView.frame = destinationImageFrame
            
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        println("Why is this working, dammit!?")

        feedViewController = toViewController as! FeedViewController
        photoViewController = fromViewController as! PhotoViewController
        
        var destinationImageFrame = feedViewController.selectedImageView.frame
        feedViewController.selectedImageView.frame = photoViewController.imageView.frame
        
        fromViewController.view.alpha = 1
        
        
        
        
        UIView.animateWithDuration(0.2, animations: {
            fromViewController.view.alpha = 0
            
            self.feedViewController.selectedImageView.frame = destinationImageFrame

            
            }) { (finished: Bool) -> Void in
                self.finish()
        }
    }
    
   
}
