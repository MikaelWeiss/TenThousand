//
//  Stopwatch-Models.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

extension ViewStopwatch {
    
    class ViewModel: ObservableObject {
        @Published var currentTime: String?
        @Published var stopwatchState: StopwatchState
        var canSave: Bool {
            return (currentTime ?? "").isEmpty
        }
        
        enum StopwatchState {
            case running
            case paused
        }
        
        init(currentTime: String? = nil) {
            self.currentTime = currentTime
            self.stopwatchState = .paused
        }
    }
    
    enum FetchStopwatchTime {
        struct Resposne {
            let time: TimeInterval
        }
    }
    
    enum StartStopwatch {
        struct Response {
            let canStart: Bool
        }
    }
    
    enum PauseStopwatch { }
    
    enum SaveStopwatch { }
    
}
