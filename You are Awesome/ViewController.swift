//
//  ViewController.swift
//  You are Awesome
//
//  Created by Matthew Batsinelas on 8/29/17.
//  Copyright © 2017 Matthew Batsinelas. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    
    // MARK: Properties
    @IBOutlet weak var messageLabel: UILabel!
    
    @IBOutlet weak var messageButton: UIButton!
   
    @IBOutlet weak var awesomeImage: UIImageView!
    
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var awesomePlayer = AVAudioPlayer()
  
    var lastIndex = -1
    var lastImage = -1
    var lastSound = -1
    let numOfImages = 5
    let numOfSounds = 3
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func playSound(soundName: String) {
        var soundName = "sound0" + String(arc4random_uniform(UInt32(numOfSounds)))
       
        if let sound = NSDataAsset(name: soundName) {
            do {
                try awesomePlayer = AVAudioPlayer(data: sound.data)
                    awesomePlayer.play()
            } catch {
                print("Error: Data from \(soundName) could not be played as an audio file")
            }
        } else {
            print("Error: Could not load data from file \(soundName)")
        }
    }
    func nonRepeatRandom(last: inout Int, range: Int) -> Int {
        var random: Int = Int(arc4random_uniform(UInt32(range)))
        
        while random == last {
            random = Int(arc4random_uniform(UInt32(range)))
        }
        last = random
            
            return random
        
    }
    
    // MARK: Actions
    
    @IBAction func soundSwitchPressed(_ sender: UISwitch) {
        if soundSwitch.isOn == false {
            awesomePlayer.stop()
        }
    }
    
    @IBAction func messageButtonPressed(_ sender: UIButton) {
        
        let messages = ["You Are Fantastic!",
                        "You Are Great!",
                        "You Are Amazing!",
                        "You Are Awesome!",
                        "when the Genius Bar needs help, they call you!",
                        "You Brighten My Day!"]

        
            var random: Int
            
        random = nonRepeatRandom(last: &lastIndex, range: messages.count)
        messageLabel.text = messages[random]
            
    
        awesomeImage.isHidden = false
        random = nonRepeatRandom(last: &lastImage, range: numOfImages)
        awesomeImage.image = UIImage(named : "image" + String (random))
        
        random = nonRepeatRandom(last: &lastSound, range: numOfSounds)
        playSound(soundName: "sound" + String(random))
        
        if soundSwitch.isOn == true {
            random = nonRepeatRandom(last: &lastSound, range: numOfSounds)
            playSound(soundName: "sound" + String(random))
        }
        
/*
        messageLabel.text = messages[index]
        
        if index == messages.count - 1 {
            index = 0
        } else {
            index = index + 1
        }


 
        let message1 = "You Are Fantastic!"
        let message2 = "You Are Great!"
        let message3 = "You Are Amazing!"
        
        
        if messageLabel.text == message1 {
            messageLabel.text = message2
            } else if messageLabel.text == message2 {
            messageLabel.text = message3
        } else {
            messageLabel.text = message1
        }
}
 
 
}
}
 } /**/*/
}
}
