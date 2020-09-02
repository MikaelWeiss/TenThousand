//
//  Stopwatch.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/25/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI


class Stopwatch: ObservableObject {
    private var log = Log()
    private var timer: Timer!
    private var pauseDate: Date?
    private var subtractingInterval: TimeInterval = 0
    private var trueTime: TimeInterval {
        if self.isPaused {
            if pauseDate != nil && log.startDate != nil {
                return pauseDate! - log.startDate! - subtractingInterval
            } else {
                return 0.0
            }
        } else {
            if log.startDate != nil {
                return Date() - log.startDate! - subtractingInterval
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
        if log.startDate == nil { log.startDate = Date() }
        isPaused = false
        if pauseDate != nil {
            self.subtractingInterval += Date() - pauseDate!
            self.log.splits?.append(Log.Split(startDate: pauseDate!, endDate: Date()))
            pauseDate = nil
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
            self.objectWillChange.send()
            self.observedString = self.trueTimeString
            self.log.totalTime = self.trueTime
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
