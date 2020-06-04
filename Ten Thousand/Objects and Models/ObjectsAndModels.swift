//
//  ObjectsAndModels.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/30/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI



//MARK: - Environment Objects:

class ObservedTimer: ObservableObject {
    @Published var timer: Timer
    
    init () {
        let timer = Timer(startDate: Date().addingTimeInterval(-600), endDate: Date())
        self.timer = timer
    }
}

class UserSettings: ObservableObject {
    @Published var profilePicture = getImage()
    @Published var name = getFromUserDefaults(key: "name") ?? ""
    @Published var email = getFromUserDefaults(key: "email") ?? ""
    @Published var password = getFromUserDefaults(key: "password") ?? ""
    @Published var accountStatus = accountStatusEnum.signingUp
}

class UserLogs: ObservableObject {
    @Published var allLogs = [
        Log(date: "Jan 1", time: "10 m", notes: "Things to say")
    ]
}

//MARK: - Data Structs and enums

// This is really just for
struct Timer {
    var startDate: Date
    var endDate: Date
    
//    func formattedElappsedTime() -> String {
//        
//    }
}

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

//MARK: - App Wide Functions
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
