//
//  Stopwatch-Models.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

extension StopwatchView {
    
    class ViewModel: ObservableObject {
        @Published var currentTime: String? = "asdf"
        @Published var stopwatchState: StopwatchState
        var canSave: Bool {
            return (currentTime ?? "").isEmpty
        }
        
        enum StopwatchState {
            case paused
            case running
        }
        
        init(currentTime: String?) {
            self.currentTime = currentTime
            self.stopwatchState = .paused
        }
    }
}
