//
//  Stopwatch-Interactor.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation

protocol ViewStopwatchRequesting {
    func didToggleStopwatchState()
    func saveLog()
}


struct ViewStopwatchInteractor: ViewStopwatchRequesting {
    let service: ViewStopwatchService
    let presenter: ViewStopwatchPresenting
    
    func didToggleStopwatchState() {
        service.toggleStopwatch()
    }
    
    func saveLog() {
        do {
            try service.saveStopwatchLog()
            presenter.presentSaveStopwatch()
        } catch let error as ViewStopwatch.ServiceError {
            presenter.presentShowError(response: ViewStopwatch.ShowError.Response(error: error))
        } catch {
            presenter.presentShowError(response: ViewStopwatch.ShowError.Response(error: .unknown))
        }
    }
    
}
