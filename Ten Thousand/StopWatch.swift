//
//  Timer.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 7/1/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation

class StopWatch: ObservableObject {
    @Published var observedTimeAsString = "00:00:00"
    @Published var observedIsPaused = true
    private var timer: Timer!
    private var start: Date?
    private var subtractingInterval: TimeInterval = 0
    private var isPaused = true {
        willSet {
            self.observedIsPaused = newValue
        }
    }
    private var pauseDate: Date?
    private var trueTime: TimeInterval {
        if self.isPaused {
            if pauseDate != nil {
                return pauseDate! - (start ?? Date()) - subtractingInterval
            } else {
                return 0.0
            }
        } else {
            return Date() - (start ?? Date()) - subtractingInterval
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
    func pause() {
        isPaused = true
        pauseDate = Date()
        self.timer.invalidate()
    }
    func play() {
        if start == nil {
            start = Date()
        }
        isPaused = false
        if pauseDate != nil {
            subtractingInterval += Date() - pauseDate!
        }
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
//            self.objectWillChange.send()
            self.observedTimeAsString = self.trueTimeString
        }
    }
    func reset() {
        isPaused = true
        start = nil
        subtractingInterval = 0
        observedTimeAsString = "00:00:00"
    }
    
    func getImportantInfoToSave() -> Info {
        return Info(start: start, subtractingInterval: subtractingInterval, isPaused: isPaused, pauseDate: pauseDate)
    }
    
    struct Info: Codable {
        let start: Date?
        let subtractingInterval: TimeInterval
        let isPaused: Bool
        let pauseDate: Date?
    }
}
