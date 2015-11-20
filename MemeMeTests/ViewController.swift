//
//  ViewController.swift
//  MemeMeTests
//
//  Created by Jason Lemrond on 11/18/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

  @IBOutlet weak var pickedImage: UIImageView!
  let imagePickerController = UIImagePickerController()
  @IBOutlet weak var camraButton: UIBarButtonItem!
  
  @IBOutlet weak var topTextField: UITextField!
  @IBOutlet weak var bottomTextField: UITextField!
  
  let textDelegate = textFieldDelegate()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    imagePickerController.delegate = self
    
    topTextField.text = "TOP"
    topTextField.textAlignment = .Center
    
    bottomTextField.text = "BOTTOM"
    bottomTextField.textAlignment = .Center
    
    topTextField.delegate = textDelegate
    bottomTextField.delegate = textDelegate
    
  }
  
  override func viewWillAppear(animated: Bool) {
    camraButton.enabled = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func pickAnImageFromAlbum(sender: UIBarButtonItem) {
    imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
    self.presentViewController(imagePickerController, animated: true, completion: nil)
  }
  
  @IBAction func pickAnImageFromCamera(sender: UIBarButtonItem) {
    imagePickerController.sourceType = UIImagePickerControllerSourceType.Camera
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