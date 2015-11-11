//
//  ViewController.swift
//  ColorChanger2
//
//  Created by Jason Lemrond on 11/11/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var switchDict: [String: UISwitch!] = ["Red": nil, "Green": nil, "Blue": nil]
    
    let layer = UIView(frame: CGRect(x: 120, y: 350, width: 100, height: 100))
    var l: CALayer {
        return layer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var i = 0
        
        self.view.backgroundColor = UIColor.blackColor()
        
        for (color, _) in switchDict {
            
            switchDict[color] = UISwitch(frame:CGRect(x: 200, y: (i * 40) + 150, width: 50, height: 40))
            
            let swit = switchDict[color]!
            
            
            //Create Switch
            swit.thumbTintColor = UIColor.whiteColor()
            swit.tintColor = UIColor.whiteColor()
            
            self.view.addSubview(swit)
            
            //Create Label
            
            let label = UILabel(frame: CGRect(x: 120, y: (i * 40) + 150, width: 50, height: 40))
            label.text = color
            
            self.view.addSubview(label)
            
            switch color {
            case "Red":   swit.onTintColor = UIColor.redColor()
            label.textColor = UIColor.redColor()
            case "Blue":  swit.onTintColor = UIColor.blueColor()
            label.textColor = UIColor.blueColor()
            case "Green": swit.onTintColor = UIColor.greenColor()
            label.textColor = UIColor.greenColor()
            default: break
            }
            
            //Add Action
            swit.addTarget(self, action: "changeLayerColor", forControlEvents: .ValueChanged)
            
            i++
        }
        
        //Finish set up of box
        l.backgroundColor = UIColor.blackColor().CGColor
        l.borderWidth = 2.0
        l.borderColor = UIColor.whiteColor().CGColor
        
        self.view.addSubview(layer)
    }
    
    func changeLayerColor() {
        
        let red: CGFloat = switchDict["Red"]!.on ? 1 : 0
        let green: CGFloat = switchDict["Green"]!.on ? 1 : 0
        let blue: CGFloat = switchDict["Blue"]!.on ? 1 : 0
        
        l.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0).CGColor
    }
    
}
