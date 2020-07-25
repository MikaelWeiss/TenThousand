//
//  Stopwatch-Service.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

protocol ViewStopwatchService {
    func toggleStopwatch()
    func saveStopwatchLog() throws
}

extension ViewStopwatch {
    enum ServiceError: Swift.Error {
        case saveFailed
        case unknown
    }
    
    struct Service: ViewStopwatchService {
        @ObservedObject var stopwatch: Stopwatch
        
        func toggleStopwatch() {
            stopwatch.toggleStopwatchState()
        }
        
        func saveStopwatchLog() throws {
            
        }
    }
}
