//
//  ViewController.swift
//  MoveUIView
//
//  Created by Jason Lemrond on 11/20/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

  var image: UIImageView = UIImageView()
  var textField: UITextField = UITextField()
  var button = UIButton()
  var thisView = UIView()
  var newImage = UIImage()
  var shareButton = UIButton()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    button = UIButton(frame: CGRect(x: 50, y: 475, width: 275, height: 30))
    button.setTitle("Click", forState: .Normal)
    button.setTitleColor(UIColor.blackColor(), forState: .Normal)
    button.addTarget(self, action: "save", forControlEvents: .TouchUpInside)
    
    shareButton = UIButton(frame: CGRect(x: 50, y: 525, width: 275, height: 30))
    shareButton.setTitle("Share", forState: .Normal)
    shareButton.setTitleColor(UIColor.blackColor(), forState: .Normal)
    shareButton.addTarget(self, action: "share", forControlEvents: .TouchUpInside)
    
    let textField = UITextField(frame: CGRect(x: 0, y: 250, width: 275, height: 30))
    textField.text = "Insert Text Here"
    textField.textAlignment = .Center
    textField.delegate = self
    
    thisView = UIView(frame: CGRect(x: 50, y: 50, width: 275, height: 400))
    
    image = UIImageView(frame: CGRect(x: 50, y: 50, width: 275, height: 400))
    image.contentMode = .ScaleAspectFit
    image.image = UIImage(named: "Photo10")!
    
    self.view.addSubview(image)
    image.addSubview(textField)
    self.view.addSubview(button)
    self.view.addSubview(shareButton)
    
    
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    subscribeToKeyboardNotifications()
  }
  
  override func viewWillDisappear(animated: Bool) {
    super.viewWillDisappear(animated)
    unsubscribeToKeyboardNotification()
  }


  
  func textFieldDidBeginEditing(textField: UITextField) {
    textField.text = ""
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
  func keyboardWillShow(notification: NSNotification) {
    view.frame.origin.y -= getKeyboardHeight(notification) - 150
  }
  
  func keyboardWillHide(notification: NSNotification) {
    view.frame.origin.y += getKeyboardHeight(notification) - 150
  }
  
  func getKeyboardHeight(notification: NSNotification) -> CGFloat {
    let userInfo = notification.userInfo
    let keyboardSize = userInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
    return keyboardSize.CGRectValue().height
  }
  
  func subscribeToKeyboardNotifications() {
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillShow:", name: UIKeyboardWillShowNotification, object: nil)
    NSNotificationCenter.defaultCenter().addObserver(self, selector: "keyboardWillHide:", name: UIKeyboardWillHideNotification, object: nil)
  }
  
  func unsubscribeToKeyboardNotification() {
    NSNotificationCenter.defaultCenter().removeObserver(self, name: UIKeyboardWillShowNotification, object: nil)
  }
  
  func save() -> UIImage {
    newImage = image.generateMemeedImage()
    return newImage
  }
  
  func share() {
    let shareImage = image.generateMemeedImage()
    let activityViewController = UIActivityViewController(activityItems: [shareImage], applicationActivities: nil)
    self.presentViewController(activityViewController, animated: true, completion: nil)
    
    //navigationController?.presentViewController(acitvityViewController, animated: true, completion: nil)
  }

  func generateMemeedImage() -> UIImage {
    UIGraphicsBeginImageContext(self.view.frame.size)
    self.view.drawViewHierarchyInRect(self.view.frame, afterScreenUpdates: true)
    let memeedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return memeedImage
  }
}

extension UIImageView {
  
  func generateMemeedImage() -> UIImage {
    UIGraphicsBeginImageContext(frame.size)
    drawViewHierarchyInRect(frame, afterScreenUpdates: true)
    let memeedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return memeedImage
  }
  
}

