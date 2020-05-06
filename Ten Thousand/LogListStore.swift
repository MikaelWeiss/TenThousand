//
//  LogListStore.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/6/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI
import Combine

class LogListStore: ObservableObject {
    @Published var allLogs: [Log] = things
}
