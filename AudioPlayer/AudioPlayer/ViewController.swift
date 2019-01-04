//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Alan Sax on 1/3/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    // ==========================
    // Mark: IB ACTIONS
    // ==========================
    
    @IBAction func handlePlayPress(_ sender: Any) {
        player.play()
        startTimer()
    }
    @IBAction func handlePausePress(_ sender: Any) {
        player.pause()
        timer.invalidate()
    }
    @IBAction func handleSliderMove(_ sender: Any) {
        player.volume = slider.value
    }
    @IBAction func handleProgressSliderMove(_ sender: Any) {
        player.currentTime =  TimeInterval(progressSlider.value)
    }
    
    // ==========================
    // MARK: IB OUTLETS
    // ==========================
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var progressSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    // ==========================
    // MARK: Notes
    // |  for the progress bar, we set the max value of the progress slider to the song length
    // |  and we start a timer to update the song progress every second
    // ==========================
    
    var timer = Timer()
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
    }
    
    @objc func fireTimer() {
        progressSlider.value = Float(player.currentTime)
        timeLabel.text = String(player.currentTime)
    }
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //volume slider
        slider.value = 100;
        
        //progress slider
        
        let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
        
        do {
           try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            progressSlider.minimumValue = 0
            progressSlider.maximumValue = Float(player.duration)
            print(player.currentTime)
            
        } catch {
            
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

