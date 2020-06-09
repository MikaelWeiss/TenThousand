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
    var pauseStartDate: Date?
    var pauseEndDate: Date?
    private var canAdjust = true
    
    
    func pause() {
        pauseStartDate = Date()
        pauseEndDate = nil
    }
    func play() {
        pauseStartDate = nil
        pauseEndDate = Date()
        canAdjust = true
    }
    
    func adjustElapsedTime() {
        if pauseEndDate != nil {
            if canAdjust {
                elapsedTime += Date() - pauseEndDate!
                canAdjust = false
            }
        }
    }
    
    func saveEverything() {
        adjustElapsedTime()
        defaults.set(elapsedTime, forKey: "elapsedTime")
        
        if pauseStartDate != nil {
            defaults.set(false, forKey: "timerGoing")
        } else {
            defaults.set(true, forKey: "timerGoing")
            defaults.set(pauseEndDate, forKey: "pauseEndDate")
        }
    }
    
    func invalidateTimer() {
        elapsedTime = 0
        pauseStartDate = nil
        pauseEndDate = nil
        canAdjust = true
    }
    
    init() {
        elapsedTime = defaults.value(forKey: "elapsedTime") as? TimeInterval ?? 0
        if defaults.bool(forKey: "timerGoing") == true {
            pauseEndDate = defaults.value(forKey: "pauseEndDate") as? Date
            canAdjust = true
            adjustElapsedTime()
        }
        defaults.removeObject(forKey: "elapsedTime")
        defaults.removeObject(forKey: "timerGoing")
        defaults.removeObject(forKey: "pauseEndDate")
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
