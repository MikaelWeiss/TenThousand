//
//  ObjectsAndModels.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/30/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI



//MARK: - Environment Objects:

class UserTimer: ObservableObject {
    @Published var elapsedTime: TimeInterval = 0
    let startDate: Date
//Defualt set to false, so that if at init the code fails to load from defaults and it returns false, then it still works fine.
    var timerIsPlaying = false
    
//    let timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(fireTimer), userInfo: nil, repeats: true)
//    
//    @objc func fireTimer() {
//        print("Timer fired!")
//    }
    
    func pause() {
        
    }
    func play() {
        
    }
    func appWillClose() {
        defaults.set(elapsedTime, forKey: "elapsedTime")
        defaults.set(startDate, forKey: "startDate")
        defaults.set(timerIsPlaying, forKey: "timerIsPlaying")
        defaults.set(Date(), forKey: "appClosedDate")
    }
    
    init() {
        self.timerIsPlaying = defaults.bool(forKey: "timerIsPlaying")
        
        if let start = defaults.value(forKey: "startDate") as? Date {
            self.startDate = start
        } else {
            self.startDate = Date()
        }
        
        if let time = defaults.value(forKey: "elapsedTime") as? TimeInterval {
            if timerIsPlaying {
                if let date = defaults.value(forKey: "appClosedDate") as? Date {
                    self.elapsedTime = time + (Date() - date)
                }
            } else {
                self.elapsedTime = time
            }
        } else {
            self.elapsedTime = 0
        }
        
        defaults.removeObject(forKey: "elapsedTime")
        defaults.removeObject(forKey: "startDate")
        defaults.removeObject(forKey: "timerIsPlaying")
        defaults.removeObject(forKey: "appClosedDate")
        
    }
}

class UserSettings: ObservableObject {
    @Published var profilePicture = getImage()
    @Published var name = getFromUserDefaults(key: "name") ?? ""
    @Published var email = getFromUserDefaults(key: "email") ?? ""
    @Published var password = getFromUserDefaults(key: "password") ?? ""
    @Published var accountStatus = getAccountStatusFromUserDefaults() {
        didSet {
            switch accountStatus {
            case .loggedIn:
                setToUserDefaults(key: "name", value: name)
                setToUserDefaults(key: "email", value: email)
                setToUserDefaults(key: "password", value: password)
            case .loggingIn:
                name = ""
                email = ""
                password = ""
            case .signingUp:
                print("signingUp")
            }
            setToUserDefaults(key: "accountStatus", value: accountStatus.rawValue)
        }
    }
}


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

//MARK: - Data Structs and enums


enum accountStatusEnum: String {
    case loggedIn = "loggedIn"
    case loggingIn = "loggingIn"
    case signingUp = "signingUp"
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

func setToUserDefaults(key: String, value: String) {
    defaults.set(value, forKey: key)
}

func getAccountStatusFromUserDefaults() -> accountStatusEnum {
    switch (getFromUserDefaults(key: "accountStatus") ?? "signingUp") {
    case "loggedIn":
       return .loggedIn
    case "loggingIn":
       return .loggingIn
    default:
       return .signingUp
    }
}

//MARK: - Important variables and constants


let defaults = UserDefaults.standard


let things: [Log] = [
    Log(date: "Jan 1", time: "10 m", notes: "Things to say")
]

//MARK: - Extentions
extension Date {
    static func - (lhs: Date, rhs: Date) -> TimeInterval {
        return lhs.timeIntervalSinceReferenceDate - rhs.timeIntervalSinceReferenceDate
    }
}
