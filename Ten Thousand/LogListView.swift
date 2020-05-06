//
//  LogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct LogListView: View {
    var body: some View {
        Text("Hello, World!")
    }
}

struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        LogListView()
    }
}


struct log {
    var id = UUID()
    var date: String
    var time: String
    var notes: String
}



var thing: [log] = [
    log(date: "Jan 1", time: "10 m", notes: "Things to say")
]
