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
    @Published var email: String?
    @Published var password: String?
    @Published var accountStatus = accountStatusEnum.signingUp
    
//    Not sure if I actually need this init (like I could probably just set the variables to equal what I set them to.
    init() {
        self.profilePicture = getImage()
        self.email = getFromUserDefaults(key: "email")
        self.password = getFromUserDefaults(key: "password")
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
