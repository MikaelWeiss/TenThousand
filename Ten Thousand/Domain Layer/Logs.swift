//
//  Logs.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 6/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

class ListOfUserLogs: ObservableObject {
    @Published var currentLog: Int = 0
    @Published var allLogLists: [UserLogs] = [
        UserLogs()
    ]
}

struct UserLogs {
    var name = "Default Title"
    var logs = [
        Log(date: "Jan 1", time: "10 m", notes: "Things to say")
    ]
}

struct Log: Identifiable {
    let id = UUID()
    var date: String
    var time: String
    var notes: String
}
