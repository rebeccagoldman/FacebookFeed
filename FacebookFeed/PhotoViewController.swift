//
//  PhotoViewController.swift
//  FacebookFeed
//
//  Created by Rebecca Goldman on 6/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet var superView: UIView!
    
    @IBOutlet weak var imageView: UIImageView!
    var image: UIImage!

    @IBOutlet weak var doneButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: 320, height: 568)
        
        imageView.image = image


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDismiss(sender: UIButton) {
        
        dismissViewControllerAnimated(true, completion: nil)
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
