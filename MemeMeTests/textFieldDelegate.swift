//
//  textFieldDelegate.swift
//  MemeMeTests
//
//  Created by Jason Lemrond on 11/19/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import Foundation
import UIKit

class textFieldDelegate: NSObject, UITextFieldDelegate {
  
  func textFieldDidBeginEditing(textField: UITextField) {
    if textField.text == "TOP" || textField.text == "BOTTOM" {
      textField.text = ""
    }
  }
  
  func textFieldShouldReturn(textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return true
  }
  
}
