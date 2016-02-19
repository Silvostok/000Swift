//
//  ViewController.swift
//  Camera
//
//  Created by Miguel Angel Rubio Caballero on 18/02/16.
//  Copyright © 2016 MiguelRubio. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var bottomMenu: UIView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }
  
  
  // MARK: New Photo
  @IBAction func newPhotoButtonPressed(sender: AnyObject) {
    
    
    let actionSheet = UIAlertController(title: "New Photo", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
    
    actionSheet.addAction(UIAlertAction(title: "Camera", style: .Default, handler: { action in
      self.showCamera()
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Album", style: .Default, handler: { action in
      self.showAlbum()
      
    }))
    
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    self.presentViewController(actionSheet, animated: true, completion: nil)
    
  }
  
  func showCamera() {
    let cameraPicker = UIImagePickerController()
    cameraPicker.delegate = self
    cameraPicker.sourceType = .Camera
    self.presentViewController(cameraPicker, animated: true, completion: nil)
  }
  
  func showAlbum() {
    let cameraPicker = UIImagePickerController()
    cameraPicker.delegate = self
    cameraPicker.sourceType = .PhotoLibrary
    self.presentViewController(cameraPicker, animated: true, completion: nil)
  }
  
  // MARK: Share
  @IBAction func shareButtonPressed(sender: AnyObject) {
    let activityController = UIActivityViewController(activityItems: ["Check out our really cool app", imageView.image!], applicationActivities: nil)
    
    presentViewController(activityController, animated: true, completion: nil)
  }
  
  
  
  
  // MARK: UIImagePickerControllerDelegate
  func imagePickerController(picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [String : AnyObject]) {
      dismissViewControllerAnimated(true, completion: nil)
      if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
        imageView.image = image
      }
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  
}

