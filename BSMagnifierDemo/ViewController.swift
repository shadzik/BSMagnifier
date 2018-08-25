//
//  ViewController.swift
//  BSMagnifier
//
//  Created by Bartosz Świątek on 25/08/2018.
//  Copyright © 2018 Bartosz Świątek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var bgImageView: UIImageView!
    private var magnifier: BSMagnifier?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        magnifier = BSMagnifier(frame: CGRect(x: view.frame.width/2, y: view.frame.height/2, width: 150, height: 150))
        magnifier?.viewToMagnify = bgImageView
        magnifier?.touchPoint = magnifier?.frame.origin
        view.addSubview(magnifier!)
        magnifier?.setNeedsDisplay()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches)
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        handleTouches(touches)
    }
    
    private func handleTouches(_ touches: Set<UITouch>) {
        if let touch = touches.first {
            magnifier?.touchPoint = touch.location(in: view)
            magnifier?.setNeedsDisplay()
        }
    }
}

