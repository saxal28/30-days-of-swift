//
//  ViewController.swift
//  Animations1
//
//  Created by Alan Sax on 10/29/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var index = 0;
    var timer = Timer();
    var isAnimating = false;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var startAnimationButton: UIButton!
    @IBOutlet weak var fadeInButton: UIButton!
    @IBOutlet weak var slideInButton: UIButton!
    @IBOutlet weak var growButton: UIButton!
    
    
    
    @objc func onTimerChange(){
        print("timer");
        
        if index == 15 {
            index = 0
        } else {
            index += 1
        }
        
        image.image = UIImage(named: "frame_\(index)_delay-0.04s.gif")
    }
    
    @IBAction func handleStartAnimation(_ sender: Any) {
        
        if isAnimating {
            isAnimating = false
            timer.invalidate()
            startAnimationButton.setTitle("Start Animation", for: [])
        } else {
            isAnimating = true
            timer = Timer.scheduledTimer(
                timeInterval: 0.04,
                target: self,
                selector: #selector(onTimerChange),
                userInfo: nil,
                repeats: true
            )
            startAnimationButton.setTitle("Stop Animation", for: [])
            
        }
    }
    
    
    @IBAction func handleFadeIn(_ sender: Any) {
        image.alpha = 0;
        UIView.animate(withDuration: 1) {
            self.image.alpha = 1;
        }
    }
    
    @IBAction func handleSlideIn(_ sender: Any) {
        image.center = CGPoint(x: image.center.x - 500, y: image.center.y)
        UIView.animate(withDuration: 1) {
            self.image.center = CGPoint(x: self.image.center.x + 500, y: self.image.center.y)
        }
    }
    
    @IBAction func handleGrow(_ sender: Any) {
        
        image.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        UIView.animate(withDuration: 1) {
            self.image.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        }
        
    }
    
}

