//
//  ZipCodeTextFieldDelegate.swift
//  TextFieldsAndDelegates
//
//  Created by Jason Lemrond on 11/15/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import Foundation
import UIKit

class ZipCodeTextFieldDelegate: NSObject, UITextFieldDelegate {
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
    // Check if new character is a string.
    if (Int(string) == nil) {
      return false
    }
    
    // Set up new text to be used.
    var newText: NSString = textField.text!
    newText = newText.stringByReplacingCharactersInRange(range, withString: string)
    
    // Check if new text is over 5 digits and return false if it is.
    if newText.length > 5 {
      return false
    } else {
      return true
    }
    
  }  // textField method end.
  
}