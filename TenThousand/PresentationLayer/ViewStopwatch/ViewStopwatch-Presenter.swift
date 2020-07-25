//
//  Stopwatch-Presenter.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

protocol ViewStopwatchPresenting {
    func presentSaveStopwatch()
    func presentShowError(response: ViewStopwatch.ShowError.Response)
}


struct ViewStopwatchPresenter: ViewStopwatchPresenting {
    @ObservedObject var viewModel: ViewStopwatch.ViewModel
    
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
}
