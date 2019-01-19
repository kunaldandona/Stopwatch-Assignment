//
//  ViewController.swift
//  stopwatchassignment
//
//  Created by Kunal Dandona on 2019-01-17.
//  Copyright © 2019 Kunal Dandona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var lapTimeLabel: UILabel!
    
    var counter = 0.0
    var timer = Timer()
    var isPlaying = false
    var laps = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        lapTimeLabel.isHidden = true // Hide the Timelabel at the start of program
        pauseButton.isEnabled = false // Disable the pause button when clock is not running
    }
    
    @IBAction func startTimer(_ sender: Any) {
        if(isPlaying) {
            return
        }
        startButton.isEnabled = false
        pauseButton.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTimer), userInfo: nil, repeats: true)
        isPlaying = true
    }
    
    @IBAction func pauseTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        lapTimeLabel.isHidden = false
        timer.invalidate()
        
        laps = timeLabel.text ?? "00:00:00"
        lapTimeLabel.text = "Lap Time:" + laps
        print(laps)
        isPlaying = false
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        lapTimeLabel.isHidden = true
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = "00:00:00"
    }
    
    @objc func UpdateTimer() {
        counter += 0.1
        let minutes = Int(counter / 60)
        let seconds = Int(counter.truncatingRemainder(dividingBy: 60))
        let tenths = Int((counter*10).truncatingRemainder(dividingBy: 10))
        timeLabel.text = String(format: "%02d:%02d:%02d", minutes, seconds, tenths)
    }
}

