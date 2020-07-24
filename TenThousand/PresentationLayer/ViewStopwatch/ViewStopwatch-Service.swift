//
//  Stopwatch-Service.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation

protocol ViewStopwatchService {
    func fetchStopwatchTime() -> TimeInterval?
    func startStopwatch()
    func saveStopwatchLog() throws
    func pauseStopwatch()
}

extension ViewStopwatch {
    enum ServiceError: Swift.Error {
        case saveFailed
        case unknown
    }
    
    struct Service: ViewStopwatchService {
        var stopwatchTime: TimeInterval?
        
        func fetchStopwatchTime() -> TimeInterval? {
            return stopwatchTime
        }
        
        func startStopwatch() {
            
        }
        
        func pauseStopwatch() {
            
        }
        
        func saveStopwatchLog() throws {
            
        }
    }
}
