//
//  StopWatchVC.swift
//  StopWatch
//
//  Created by apple on 2018/10/9.
//  Copyright © 2018 Kuang-Der Wu. All rights reserved.
//

import UIKit

class StopWatchVC: UIViewController {

    var stopWatchView: StopWatchView!
    var timer = Timer()
    var isTimerRunning = false
    var counter = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        
        //MARK: for action target
        stopWatchView.pauseButton.addTarget(self, action: #selector(pauseButtonTouched), for: UIControl.Event.touchUpInside)
        stopWatchView.resetButton.addTarget(self, action: #selector(resetButtonTouched), for: UIControl.Event.touchUpInside)
        stopWatchView.startButton.addTarget(self, action: #selector(startButtonTouched), for: UIControl.Event.touchUpInside)
        
        UIUpdate(reset: false, pause: false , start: true)
    }
    
    
    func UIUpdate(reset: Bool, pause: Bool, start: Bool) {
        // true -> Show/Enabled
        // false -> No Show/Disabled
        
        let _duration: TimeInterval = 0.3
        if reset {
            stopWatchView.resetButton.fadeTo(duration: _duration, alpha: 1.0)
        } else {
            stopWatchView.resetButton.fadeTo(duration: _duration, alpha: 0.1)
        }
        
        if pause {
            stopWatchView.pauseButton.fadeTo(duration: _duration, alpha: 1.0)
        } else {
            stopWatchView.pauseButton.fadeTo(duration: _duration, alpha: 0.1)
        }
        
        if start {
            stopWatchView.startButton.fadeTo(duration: _duration, alpha: 1.0)
        } else {
            stopWatchView.startButton.fadeTo(duration: _duration, alpha: 0.1)
        }
        
        stopWatchView.resetButton.isEnabled = reset
        stopWatchView.pauseButton.isEnabled = pause
        stopWatchView.startButton.isEnabled = start

    }
    
    
    func setupLayout() {
        stopWatchView = StopWatchView(frame: self.view.frame)
        stopWatchView.frame = self.view.bounds
        self.view.addSubview(stopWatchView)
    }
    
    @objc func runTimer() {
        counter += 0.1
        let flooredCounter = Int(floor(counter))
        let hour = flooredCounter/3600
        var hourString = "\(hour)"
        if hour < 10 {
            hourString = "0\(hour)"
        }
        
        let minute = (flooredCounter % 3600) / 60
        var minuteString = "\(minute)"
        if minute < 10 {
            minuteString = "0\(minute)"
        }
        
        let second = (flooredCounter % 3600) % 60
        var secondString = "\(second)"
        if second < 10 {
            secondString = "0\(second)"
        }
        
        let decisecond = String(format: "%.1f",counter).components(separatedBy: ".").last!
        stopWatchView.timerLabel.text = "\(hourString):\(minuteString):\(secondString).\(decisecond)"
    }

    @objc func startButtonTouched() {
        if !isTimerRunning {
            timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
            isTimerRunning = true
            UIUpdate(reset: true, pause: true , start: false)
        }
    }

    @objc func pauseButtonTouched() {
        timer.invalidate()
        isTimerRunning = false
        UIUpdate(reset: true, pause: false , start: true)
    }
    
    @objc func resetButtonTouched() {
        timer.invalidate()
        isTimerRunning = false
        counter = 0.0
        UIUpdate(reset: false, pause: false , start: true)
        stopWatchView.timerLabel.text = "00:00:00.0"
    }
}
