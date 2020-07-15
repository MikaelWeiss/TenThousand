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
        @Published var currentTime: String?
        @Published var stopwatchState: StopwatchState
        var canSave: Bool {
            return currentTime != nil
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
    
    enum CheckCanSave {
        struct Response {
            let canSave: Bool
        }
    }
    
    enum Styles {
        static let timerTextFont = Font.system(.largeTitle, design: .rounded)
        static let saveButtonFont = Font.system(.title, design: .rounded)
        static let pausePlayImageFont = Font.system(size: 30, weight: .bold)
    }
    
    enum Images {
        static let pauseImage = "pause.circle.fill"
        static let playImage = "play.circle.fill"
    }
    
    enum Strings {
        static let saveButtonTitle = "Save"
    }
}
