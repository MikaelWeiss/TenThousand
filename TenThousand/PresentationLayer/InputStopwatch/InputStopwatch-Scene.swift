//
//  Stopwatch-Scene.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation

enum ViewStopwatch {
    
    struct Scene {
        let viewModel = ViewStopwatch.ViewModel()
        
        let viewController: ViewStopwatchViewController
        init() {
            let service = ViewStopwatch.Service()
            let presenter = ViewStopwatchPresenter(viewModel: viewModel)
            let interactor = ViewStopwatchInteractor(service: service, presenter: presenter)
            
            self.viewController = ViewStopwatchViewController(ViewModel: viewModel, interactor: interactor)
        }
    }
    
}
