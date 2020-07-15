//
//  Log.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation


struct Log {
    let startDate: Date
    let totalTime: TimeInterval
    let notes: String?
    
    struct Split {
        let startDate: Date
        let endDate: Date
        var splitDuration: TimeInterval {
            startDate - endDate
        }
    }
}
