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
        @ObservedObject var stopwatch: Stopwatch
        @Published var isShowingAlert = false
        @Published var isShowingSaveLog = false
        var alertValues: AlertValues
        
        var canSave: Bool {
            return stopwatch.observedString != ViewStopwatch.Strings.defaultDisplayedEmptyTime
        }
        
        init(stopwatch: Stopwatch) {
            self.stopwatch = stopwatch
            self.alertValues = AlertValues(
                alerTitle: ViewStopwatch.Strings.alertTitleDefault,
                alertMessage: ViewStopwatch.Strings.alertMessageDefault,
                alertActionTitle: ViewStopwatch.Strings.alertActionTitleDefault)
        }
    }
    
    enum FetchStopwatchTime {
        struct Resposne {
            let time: TimeInterval?
        }
    }
    
    enum StartStopwatch { }
    
    struct AlertValues {
        let alerTitle: String
        let alertMessage: String
        let alertActionTitle: String
    }
    
    enum PauseStopwatch { }
    
    enum SaveStopwatch { }
    
    enum ShowError {
        struct Response {
            var error: ViewStopwatch.ServiceError
        }
    }
    
    enum Strings {
        static let defaultDisplayedEmptyTime = "00:00:00"
        static let alertTitleDefault = "Request Failure"
        static let alertTitleSaveFailed = "Save Failed"
        static let alertMessageDefault = "Something bad happened. Please try again."
        static let alertActionTitleDefault = "OK"
    }
}
