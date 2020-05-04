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
        ZStack {
            Logo()
            VStack (alignment: .leading) {
                Rectangle()
                    .frame(maxWidth: .infinity)
                    .frame(height: 44)
                    .opacity(0.0001)
                Text("Computer Programming")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .lineLimit(1)
                    .padding(.horizontal)
                    
                Rectangle()
                    .frame(height: 1)
                    .padding(.leading)
                    .frame(maxWidth: .infinity)
                    .opacity(0.3)
                
                List(testLogInfo) { log in
                    VStack(alignment: .leading) {
                        Text("Log \(log.logNumber)")
                            .font(.custom("AvenirNext-Heavy", size: 30))
                        Text(log.totalTime)
                            .font(.custom("Impact", size: 16)).opacity(0.5)
                        Text("\(log.startTime) - \(log.endTime), \(log.startDate)")
                            .font(.custom("AvnirNext-DemiBold", size: 14))
                            .opacity(0.5)
                        Text("Notes: ")
                            .font(.custom("AvnirNext-DemiBold", size: 14))
                            .opacity(0.5)
                            .offset(x: 1)
                        Text("  \(log.notes)")
                            .font(.custom("AvnirNext-DemiBold", size: 14))
                            .opacity(0.5)
                            .multilineTextAlignment(.leading)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
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
