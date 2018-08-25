//
//  BSMagnifier.swift
//  BSMagnifier
//
//  Created by Bartosz Świątek on 25/08/2018.
//  Copyright © 2018 Bartosz Świątek. All rights reserved.
//
//  Based on https://coffeeshopped.com/2010/03/a-simpler-magnifying-glass-loupe-view-for-the-iphone
//  and https://github.com/acoomans/iOS-MagnifyingGlass but simpler

import UIKit
import QuartzCore

class BSMagnifier: UIView {
    
    var viewToMagnify: UIView?
    var scale: CGFloat = 2.0
    var touchPointOffset: CGPoint!
    
    var touchPoint: CGPoint! {
        didSet {
            self.center = CGPoint(x: touchPoint.x + touchPointOffset.x, y: touchPoint.y + touchPointOffset.y)
        }
    }
    
    private var defaultOffset: CGFloat = -60
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 1.0
        layer.cornerRadius = frame.width/2
        layer.masksToBounds = true
        
        touchPointOffset = CGPoint(x: 0, y: defaultOffset)
        viewToMagnify = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var frame: CGRect {
        set {
            super.frame = newValue
            layer.cornerRadius = newValue.width/2
        }
        get {
            return super.frame
        }
    }
    
    override func draw(_ rect: CGRect) {
        guard let context: CGContext = UIGraphicsGetCurrentContext(),
            let viewToMagnify = viewToMagnify,
            let touchPoint = touchPoint else { return }
        
        context.translateBy(x: frame.width/2, y: frame.height/2)
        context.scaleBy(x: scale, y: scale)
        context.translateBy(x: -touchPoint.x, y: -touchPoint.y)
        viewToMagnify.layer.render(in: context)
    }    
}
