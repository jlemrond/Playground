//
//  ViewController.swift
//  TextFieldsAndDelegates
//
//  Created by Jason Lemrond on 11/15/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  var textField1: UITextField!
  var textField2: UITextField!
  var textField3: UITextField!
  var textArray: [UITextField]!
  
  // Background color is Faded Navy
  let bgColor = UIColor(red: CGFloat(68/255.0), green: CGFloat(68/255.0), blue: CGFloat(68/255.0), alpha: CGFloat(1.0))
  // Text Field color is Overcast (White)
  let textFieldColor = UIColor(red: CGFloat(241/255.0), green: CGFloat(241/255.0), blue: CGFloat(242/255.0), alpha: CGFloat(1.0))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Change background to Faded Navy.
    view.backgroundColor = bgColor
    
    // Establish and set up TextFields
    let textFieldWidth = (view.frame.width - 30)
    
    textField1 = UITextField(frame: CGRect(x: 15, y: 30, width: textFieldWidth, height: 30))
    textField2 = UITextField(frame: CGRect(x: 15, y: 65, width: textFieldWidth, height: 30))
    textField3 = UITextField(frame: CGRect(x: 15, y: 100, width: textFieldWidth, height: 30))
    textArray = [textField1, textField2, textField3]
    
    for field in textArray {
        field.backgroundColor = textFieldColor
        field.borderStyle = UITextBorderStyle.RoundedRect
        self.view.addSubview(field)
    }
      
  }  // ViewDidLoad End

}

