//
//  User.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import Foundation

struct User {
    var activityGroups: [ActivityGroup]?
    var userSettings: UserSettings
    
    struct UserSettings {
        var name: String?
    }
}
