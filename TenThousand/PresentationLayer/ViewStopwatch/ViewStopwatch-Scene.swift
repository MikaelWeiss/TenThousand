//
//  Stopwatch-Scene.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

enum ViewStopwatch {
    
    struct Scene {
        let viewController: ViewStopwatchViewController
        
        init(stopwatch: Stopwatch) {
            let viewModel = ViewStopwatch.ViewModel(stopwatch: stopwatch)
            let service = ViewStopwatch.Service(stopwatch: stopwatch)
            let presenter = ViewStopwatchPresenter(viewModel: viewModel)
            let interactor = ViewStopwatchInteractor(service: service, presenter: presenter)
            
            self.viewController = ViewStopwatchViewController(viewModel: viewModel, interactor: interactor)
        }
    }
    
}
