//
//  Log.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation


struct Log {
    var startDate: Date? = nil
    var totalTime: TimeInterval = 0
    var splits: [Split]? = nil
    var notes: String? = nil
    
    struct Split {
        let startDate: Date
        let endDate: Date
        var splitDuration: TimeInterval {
            startDate - endDate
        }
    }
}
