//
//  ListStore.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/6/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI
import Combine

class logList: ObservableObject {
    @Published var allLogs: [log] = things
}
