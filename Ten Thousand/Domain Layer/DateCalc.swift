//
//  DateCalc.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 6/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation

extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
