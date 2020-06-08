//
//  UserSettingsStore.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 6/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

let defaults = UserDefaults.standard

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
