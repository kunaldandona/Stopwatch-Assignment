//
//  Stopwatch.swift
//  stopwatchassignment
//
//  Created by Kunal Dandona on 2019-01-19.
//  Copyright © 2019 Kunal Dandona. All rights reserved.
//

import Foundation

class Stopwatch {
    
    private var startTime: Date?
    
    var elapsedTime: TimeInterval{
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start(){
            startTime = Date()
    }
    
    func stop(){
        startTime = nil
    }
}
