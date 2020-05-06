//
//  LogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct LogListView: View {
    
    @ObservedObject var store = ListStore()
    
    var body: some View {
        NavigationView {
            List {
                ForEach (store.allLogs) { thing in
                    VStack (alignment: .leading) {
                        HStack {
                            Text("\(thing.date) , \(thing.time)")
                        }
                        Text(thing.notes)
                            .multilineTextAlignment(.leading)
                    }
                }
            }.navigationBarTitle(Text("Test"))
        }
    }
}

struct LogListView_Previews: PreviewProvider {
    static var previews: some View {
        LogListView()
    }
}


struct Log: Identifiable {
    var id = UUID()
    var date: String
    var time: String
    var notes: String
}



var things = [
    Log(date: "Jan 1", time: "10 m", notes: "Things to say")
]
