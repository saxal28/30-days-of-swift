//
//  ViewController.swift
//  SwipesAndShakes
//
//  Created by Alan Sax on 1/4/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ===========================
        // MARK: DEVICE SWIPE
        // ===========================
        
        // swipe left
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        // swipe right
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Swipe Right")
        case UISwipeGestureRecognizerDirection.left:
            print("Swipe Left")
        default:
            break
        }
    }

    
    // ===========================
    // MARK: DEVICE SHAKE
    // ===========================
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        // shake event handler
        if event?.subtype == UIEventSubtype.motionShake {
            print("Device was shaken!")
        }
    }


}

