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
    }
    @IBAction func handlePausePress(_ sender: Any) {
        player.pause()
    }
    @IBAction func handleSliderMove(_ sender: Any) {
        player.volume = slider.value
    }
    
    // ==========================
    // MARK: IB OUTLETS
    // ==========================

    @IBOutlet weak var slider: UISlider!
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let audioPath = Bundle.main.path(forResource: "sheep", ofType: "mp3")
        
        do {
           try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            
        } catch {
            
            print(error)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

