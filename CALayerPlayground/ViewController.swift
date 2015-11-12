//
//  ViewController.swift
//  CALayerPlayground
//
//  Created by Jason Lemrond on 10/16/15.
//  Copyright © 2015 Jason Lemrond. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewForLayer: UIView!
    
    var l: CALayer {
        return viewForLayer.layer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayer()
        createSquares(100)
        print(UIScreen.mainScreen().bounds.width)
    }

    func setupLayer() {
        l.backgroundColor = UIColor.blueColor().CGColor
        l.borderWidth = 100.0
        l.borderColor = UIColor.redColor().CGColor
        l.shadowOpacity = 0.7
        l.shadowRadius = 10.0
        l.contents = UIImage(named: "star")?.CGImage
        l.contentsGravity = kCAGravityCenter
        //l.masksToBounds = true
    }

    @IBAction func tapGestureRecognize(sender: UITapGestureRecognizer) {
        l.shadowOpacity = l.shadowOpacity == 0.7 ? 0.0 : 0.7
    }

    @IBAction func pinchGestureRecognize(sender: UIPinchGestureRecognizer) {
        let offset: CGFloat = sender.scale < 1 ? 5.0 : -5.0
        let oldFrame = l.frame
        let oldOrigin = oldFrame.origin
        let newOrigin = CGPoint(x: oldOrigin.x + offset, y: oldOrigin.y + offset)
        let newSize = CGSize(width: oldFrame.width + (offset * -2.0), height: oldFrame.height + (offset * -2.0))
        let newFrame = CGRect(origin: newOrigin, size: newSize)
        if newFrame.width >= 100.0 && newFrame.width <= 300.0 {
            l.borderWidth -= offset
            l.cornerRadius += (offset / 2.0)
            l.frame = newFrame
        }
    }
    
    func createSquares(x: Int) {
        for i in 1...x {
            print(i)
            var viewLayer = UIView(frame: CGRect(x: 3 * i, y: 80, width: 12, height: 8))
            
            var layer: CALayer {
                return viewLayer.layer
            }
            
            layer.backgroundColor = UIColor.greenColor().CGColor
            
            self.view.addSubview(viewLayer)
            
        }
    }
    
}

