//
//  CurrencyTextFieldDelegate.swift
//  TextFieldsAndDelegates
//
//  Created by Jason Lemrond on 11/16/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import Foundation
import UIKit

class CurrencyTextFieldDelegate: NSObject, UITextFieldDelegate {
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    
    var newStr: String?
    var currStrRange: NSRange = range
    var charSet: [Character] = []
    var go = false
    
    // Get new text that will be used for formating.
    var newText = NSString(string: textField.text!) as NSString
    newText = newText.stringByReplacingCharactersInRange(range, withString: string)
    
    // Convert from NSString to String
    let str: String? = String(newText)
    
    if let str = str {
      // Create Character Set Array
      for char in str.characters {
        charSet.append(char)
      }
      
      // Create String Range for new text
      currStrRange = newText.rangeOfString(String(charSet))
      
      // Remove any left over speicial characters.
      charSet = removeCharacter(charSet, remove: ".")
      charSet = removeCharacter(charSet, remove: "$")

      // Remove 0s from previous text.
      if charSet != [] {
        repeat {
          if charSet[0] == "0" {
            charSet.removeAtIndex(0)
          }
          
          if charSet.isEmpty {
            break
          }
        } while charSet[0] == "0"
      }
      
      // Check if set is empty, else execute formating.
      if charSet.isEmpty {
        newText = newText.stringByReplacingCharactersInRange(currStrRange, withString: "$00.00")
        go = true
      } else {
        // Add Leading 0s.
        if charSet.count < 4 {
          repeat {
          charSet.insert("0", atIndex: 0)
          } while charSet.count < 4
        }
        
//        if charSet.count > 5 {
//          let i: Int = (charSet.count - 3) / 3
//          for n in 1...i {
//            charSet.insert(
//          }
//        }
        
        // Insert Decimal Point
        charSet.insert(".", atIndex: charSet.count - 2)
        
        // Insert $
        if charSet[0] != "$" {
          charSet.insert("$", atIndex: 0)
        }
        
        // Convert to String and change 'newText' to new format.
        newStr = String(charSet)
        newText = newText.stringByReplacingCharactersInRange(currStrRange, withString: newStr!)
        go = true
      }
    }

    // Replace Text in TextField with new format.
    if go {
      textField.text = newText as String
      return false
    } else {
      return true
    }
    
  }  // textField End.
  
  func textFieldDidBeginEditing(textField: UITextField) {
    textField.text = "$00.00"
  }
  
  func removeCharacter(var set: [Character], remove: Character) -> [Character]{
    repeat {
      if set.contains(remove) {
        set.removeAtIndex(set.indexOf(remove)!)
      }
    } while set.contains(remove)
    
    return set
  }
}
