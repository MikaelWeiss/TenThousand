//
//  ObjectsAndModels.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/30/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI



//MARK: - Environment Objects:

class Timer: ObservableObject {
    @Published var startTime = Date()
    @Published var currentTime = Date()
    @Published var timeElapsed = Date()
    @Published var timerIsRunning = false
}



class UserSettings: ObservableObject {
    @Published var profilePicture: Image?
    @Published var email = String()
    @Published var password = String()
    @Published var accountStatus = accountStatusEnum.signingUp
    
    init(email: String, password: String) {
        self.profilePicture = getImage()
        self.email = email
        self.password = password
    }
}

class UserInfo: ObservableObject {
    @Published var allLogs = [
        Log(date: "Jan 1", time: "10 m", notes: "Things to say")
    ]
}

//MARK: - Data Structs


struct Log: Identifiable {
    var id = UUID()
    var date: String
    var time: String
    var notes: String
}

var things = [
    Log(date: "Jan 1", time: "10 m", notes: "Things to say")
]
