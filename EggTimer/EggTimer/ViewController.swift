//
//  ViewController.swift
//  EggTimer
//
//  Created by Alan Sax on 10/25/18.
//  Copyright © 2018 Alan Sax. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = Timer();
    var timerStart = 120;

    override func viewDidLoad() {
        super.viewDidLoad();
        updateLabel();
    }
    

    @objc func fireTimer() {
        
        if(timerStart > 0) {
            timerStart -= 1;
            updateLabel()
        } else {
            timer.invalidate();
        }
       
    }
    
    
    
    //============================
    //MARK: Outlets
    //============================
    
    
    @IBOutlet weak var timerLabel: UILabel!
    
    
    //============================
    //MARK: Actions
    //============================

    
    @IBAction func playButtonPressed(_ sender: Any) {
        print("pressed play");
        startTimer();
    }
    
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        print("pressed pause");
        stopTimer();
    }
    
    
    @IBAction func add10SecondsButtonPressed(_ sender: Any) {
        print("add 10 seconds");
        timerStart += 10;
        updateLabel();
    }
    
    
    @IBAction func minue10SecondsButtonPressed(_ sender: Any) {
        print("subtract 10 seconds");
        timerStart -= 10;
        updateLabel();
    }
    
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        print("pressed reset");
        timerStart = 120;
        updateLabel();
    }
    
    //============================
    //MARK: Timer Functions
    //============================
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true);
    }
    
    func stopTimer() {
        timer.invalidate();
    }
    
    func updateLabel() {
        timerLabel.text = String(timerStart);
    }
    

}

