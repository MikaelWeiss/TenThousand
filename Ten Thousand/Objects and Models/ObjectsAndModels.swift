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
    @Published var profilePicture = getImage()
    @Published var email = getFromUserDefaults(key: "email")
    @Published var password = getFromUserDefaults(key: "password")
    @Published var accountStatus = accountStatusEnum.signingUp
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


enum accountStatusEnum {
    case loggedIn
    case loggingIn
    case signingUp
}


func getImage() -> Image? {
    guard let imageData = defaults.data(forKey: "ProfilePicture") else { return nil }
    return Image(uiImage: UIImage(data: imageData)!)
}

func getFromUserDefaults(key: String) -> String? {
    guard let data = defaults.string(forKey: key) else { return nil }
    return data
}

//MARK: - Important variables and constants


let defaults = UserDefaults.standard


var things = [
    Log(date: "Jan 1", time: "10 m", notes: "Things to say")
]
