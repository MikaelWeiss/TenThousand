//
//  Stopwatch-Presenter.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

protocol ViewStopwatchPresenting {
    func presentFetchTime(with response: ViewStopwatch.FetchStopwatchTime.Resposne)
    func presentStartStopwatch()
    func presentPauseStopwatch()
    func presentSaveStopwatch()
    func presentShowError(response: ViewStopwatch.ShowError.Response)
}


struct ViewStopwatchPresenter: ViewStopwatchPresenting {
    @ObservedObject var viewModel: ViewStopwatch.ViewModel
    
    func presentFetchTime(with response: ViewStopwatch.FetchStopwatchTime.Resposne) {
        let timeString: String?
        
        if let time = response.time {
            timeString = getStringFromTimeInterval(time: time)
        } else {
            timeString = ViewStopwatch.Strings.defaultDisplayedEmptyTime
        }
        
        viewModel.currentTime = timeString
    }
    
    func presentStartStopwatch() {
        viewModel.stopwatchState = .running
    }
    
    func presentPauseStopwatch() {
        viewModel.stopwatchState = .paused
    }
    
    func presentSaveStopwatch() {
        
    }
    
    func presentShowError(response: ViewStopwatch.ShowError.Response) {
        let error = response.error
        
        var alertTitle = ViewStopwatch.Strings.alertTitleDefault
        let alertMessage = ViewStopwatch.Strings.alertMessageDefault
        let alertActionTitle = ViewStopwatch.Strings.alertActionTitleDefault
        
        switch error {
        case .saveFailed:
            alertTitle = ViewStopwatch.Strings.alertTitleSaveFailed
        case .unknown:
            alertTitle = ViewStopwatch.Strings.alertTitleDefault
        }
        
        viewModel.alertValues = ViewStopwatch.AlertValues(
            alerTitle: alertTitle,
            alertMessage: alertMessage,
            alertActionTitle: alertActionTitle)
    }
    
    
    private func getStringFromTimeInterval(time: TimeInterval) -> String {
        let counter = Int(time)
        let hours = counter / 3600
        let minutes = (counter % 3600) / 60
        let seconds =  (counter % 3600) % 60
        
        let hoursString = "\(hours < 10 ? "0" : "")\(hours)"
        let minutesString = "\(minutes < 10 ? "0" : "")\(minutes)"
        let secondsString = "\(seconds < 10 ? "0" : "")\(seconds)"
        
        return hoursString + ":" + minutesString + ":" + secondsString
    }
}
