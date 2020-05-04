//
//  LogView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/2/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct LogView: View {
    var body: some View {
        VStack {
            Text("Computer Programming")
                .font(.title)
                .fontWeight(.black)
                .lineLimit(1)
                .padding(.horizontal)
                .padding(.top)
            Rectangle()
                .frame(height: 1)
                .padding(.horizontal)
                .frame(maxWidth: .infinity)
                .opacity(0.7)
            
            List(testLogInfo) { log in
                VStack(alignment: .leading) {
                    Text("Log \(log.logNumber)")
                        .font(.custom("AvenirNext-Heavy", size: 30))
                    Text(log.totalTime)
                        .font(.custom("Impact", size: 16)).opacity(0.5)
                    Text("\(log.startTime) - \(log.endTime), \(log.startDate)")
                        .font(.custom("AvnirNext-DemiBold", size: 10))
                        .opacity(0.5)
                    Text("Notes")
                }
            }
        }
    }
}

struct LogView_Previews: PreviewProvider {
    static var previews: some View {
        LogView()
    }
}


struct logInfo: Identifiable {
    var id: UUID
    var logNumber: Int
    var totalTime: String
    var notes: String
    
//    I want to make all this the correct type of values, but I don't know how to do that yet, so I'm doing it like this for now, just so I can get the app, up and running, then I'll go through and fix up the incorect/incomplete code.
    var startTime: Int
    var endTime: Int
    var startDate: String
}


var testLogInfo: [logInfo] = [
    logInfo(id: UUID(), logNumber: 1, totalTime: "Two Hours", notes: "None", startTime: 1, endTime: 2, startDate: "Jan 1")
]
