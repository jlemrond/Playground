//
//  ViewController.swift
//  MemeMeTests
//
//  Created by Jason Lemrond on 11/18/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

  @IBOutlet weak var pickedImage: UIImageView!
  let imagePickerController = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    imagePickerController.delegate = self
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func pickAnImage(sender: UIBarButtonItem) {

    self.presentViewController(imagePickerController, animated: true, completion: nil)
    
  }
  
  
  //MARK: Image Picker Delegate Methods
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    
    if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
      pickedImage.contentMode = .ScaleAspectFit
      pickedImage.image = selectedImage
    }
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  func imagePickerControllerDidCancel(picker: UIImagePickerController) {
    dismissViewControllerAnimated(true, completion: nil)
  }

}