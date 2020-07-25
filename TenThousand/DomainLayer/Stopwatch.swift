//
//  Stopwatch.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/25/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI


class Stopwatch: ObservableObject {
    private var timer: Timer!
    private var start: Date? = nil
    private var subtractingInterval: TimeInterval = 0
    private var pauseDate: Date?
    private var trueTime: TimeInterval {
        if self.isPaused {
            if pauseDate != nil && start != nil {
                return pauseDate! - start! - subtractingInterval
            } else {
                return 0.0
            }
        } else {
            if start != nil {
                return Date() - start! - subtractingInterval
            } else {
                return 0.0
            }
        }
    }
    private var trueTimeString: String {
        let counter = Int(trueTime)
        let hours = counter / 3600
        let minutes = (counter % 3600) / 60
        let seconds =  (counter % 3600) % 60
        
        let hoursString = "\(hours < 10 ? "0" : "")\(hours)"
        let minutesString = "\(minutes < 10 ? "0" : "")\(minutes)"
        let secondsString = "\(seconds < 10 ? "0" : "")\(seconds)"
        
        return hoursString + ":" + minutesString + ":" + secondsString
    }
    
    @Published private(set) var observedString = ViewStopwatch.Strings.defaultDisplayedEmptyTime
    @Published private(set) var isPaused = true
    
    private func pauseTimer() {
        isPaused = true
        pauseDate = Date()
        self.timer.invalidate()
    }
    
    private func playTimer() {
        if start == nil { start = Date() }
        isPaused = false
        if pauseDate != nil {
            subtractingInterval += Date() - pauseDate!
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.objectWillChange.send()
            self.observedString = self.trueTimeString
        }
    }
    
    func toggleStopwatchState() {
        if isPaused {
            playTimer()
        } else {
            pauseTimer()
        }
    }
}
