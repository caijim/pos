//
//  PhotoMapViewController.swift
//  Photo Map
//
//  Created by Jim Cai on 5/14/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class PhotoMapViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, LocationsViewControllerDelegate {

    @IBOutlet weak var cameraButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
            self.dismissViewControllerAnimated(true, completion: { () -> Void in
                
                // YOU ONLY WANNA DO STUFF AFTER dismissal takes place
                
                self.performSegueWithIdentifier("addLocationSegue", sender: self)
                var originalImage = info[UIImagePickerControllerOriginalImage] as UIImage
                var editedImage = info[UIImagePickerControllerEditedImage] as UIImage
            })
    }
    
    func locationsViewControllerDelegate(locationsController: LocationsViewController, lat: NSNumber, long: NSNumber) {
        println(lat)
        println(long)
        dismissViewControllerAnimated(true, completion: { () -> Void in
            //
        })
    }
    
    // MARK: Actions

    @IBAction func onCameraButtonPressed(sender: AnyObject) {
        var vc = UIImagePickerController()
        vc.delegate = self
        vc.allowsEditing = true
        vc.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        var vc = segue.destinationViewController as LocationsViewController
        vc.delegate = self
    }
    

}
