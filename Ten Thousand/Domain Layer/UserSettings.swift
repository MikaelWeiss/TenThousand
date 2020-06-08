//
//  UserInfo.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 6/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI


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
