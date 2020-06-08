//
//  Timer.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 6/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

class Timer: ObservableObject {
    @Published var startDate = Date().addingTimeInterval(-600)
    @Published var endDate = Date()
    @Published var timerRunning = false
    
    var elappsedTime: TimeInterval {
        return endDate - startDate
    }
}
