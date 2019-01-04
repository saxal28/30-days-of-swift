//
//  ViewController.swift
//  SoundShaker
//
//  Created by Alan Sax on 1/4/19.
//  Copyright © 2019 Alan Sax. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if event?.subtype == UIEventSubtype.motionShake {
            print("SHAKES!");
            playRandomSound()
        }
    }
    
    func playRandomSound() {
        let number = arc4random_uniform(9) + 1
        let randomSound = "sound_\(number)"
        let audioPath = Bundle.main.path(forResource: randomSound, ofType: "mp3")
    
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
            player.play()
        } catch {
            print("ERROR", error, randomSound)
        }

    }

}

