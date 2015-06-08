//
//  PhotoViewController.swift
//  FacebookFeed
//
//  Created by Rebecca Goldman on 6/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

 
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var photoActionsView: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!

    
    @IBOutlet weak var doneView: UIImageView!
    var currentCenter: CGRect!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 2000, height: 600)
        
        imageView.image = image
        scrollView.delegate = self

        currentCenter = imageView.bounds

        println("\(currentCenter)")


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func convertValue(value: Float, r1Min: Float, r1Max: Float, r2Min: Float, r2Max: Float) -> Float {
        var ratio = (r2Max - r2Min) / (r1Max - r1Min)
        return value * ratio + r2Min - r1Min * ratio
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        // This method is called as the user scrolls
        
        if scrollView.contentOffset.y < 0 {
         
            currentCenter = imageView.bounds

        var newAlpha = convertValue(Float(scrollView.contentOffset.y), r1Min: 0, r1Max: -600, r2Min: 1, r2Max: 0) // rotation based on translation
        
            scrollView.alpha = CGFloat(newAlpha)
            
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                
                
                self.doneView.alpha = 0
                self.photoActionsView.alpha = 0
                }, completion: nil)
     
            
            
        } else if scrollView.contentOffset.y >= 0 {
          
            UIView.animateWithDuration(0.1, animations: { () -> Void in
        
                
                self.doneView.alpha = 1
                self.photoActionsView.alpha = 1
            }, completion: nil)
        
        }
        
        
        
        
    }
    

    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
        willDecelerate decelerate: Bool) {
            
            currentCenter = imageView.bounds
            
            println("\(currentCenter)")

            if scrollView.contentOffset.y < -100  {
//                doneView.alpha = 0
//                photoActionsView.alpha = 0
//                
                
                dismissViewControllerAnimated(true, completion: nil)
                
            } else {
                
//                doneView.alpha = 1
//                photoActionsView.alpha = 1
                
            }
            
            println("user stopped dragging")
    }
    

    
    @IBAction func didTapDismiss(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
    }

        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


