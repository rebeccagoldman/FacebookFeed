//
//  FeedViewController.swift
//  FacebookFeed
//
//  Created by Rebecca Goldman on 6/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    
//    var isPresenting: Bool = true
    
    @IBOutlet weak var wedding1View: UIImageView!
    @IBOutlet weak var wedding2View: UIImageView!
    @IBOutlet weak var wedding3View: UIImageView!
    @IBOutlet weak var wedding4View: UIImageView!
    @IBOutlet weak var wedding5View: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIView!
    var selectedImageView: UIImageView!
//    var window = UIApplication.sharedApplication().keyWindow
    var imageTransition: ImageTransition!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 568)
        
        // Do any additional setup after loading the view.
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }
    
    @IBAction func didTapPhoto(sender: AnyObject) {
        
        println("okay, this should be working") 
        
        selectedImageView = sender.view as! UIImageView
        performSegueWithIdentifier("photoSegue", sender: self)
        
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        println("I'm about to segue to another view controller")
        
        var destinationViewController = segue.destinationViewController as! PhotoViewController
        destinationViewController.image = self.selectedImageView.image
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        imageTransition = ImageTransition()
        destinationViewController.transitioningDelegate = imageTransition

        
        
    }
    
    
    
    
}

    
    
