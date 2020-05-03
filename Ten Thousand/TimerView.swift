//
//  TimerView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/2/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @State var hours = 0
    @State var minutes = 0
    @State var seconds = 0
    @State var timerRunning = false
    
    
    var body: some View {
        ZStack {
            Logo()
            VStack {
                Text("\(hours):\(minutes):\(seconds)")
                    .font(.custom("AvenirNext-Medium", size: 60))
                    .fontWeight(.heavy)
                    .shadow(radius: 5, x: 0, y: 2)
                    .padding()
                
                HStack {
                    ActionButton(buttonName: timerRunning ? "Stop" : "Start", buttonHight: 45, buttonWidth: 200, fontSize: 30)
                        .onTapGesture {
                            self.timerRunning.toggle()
                            if self.timerRunning {
                                _ = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
                                    self.timeProsesser()
                                })
                            } else {
                                self.hours = 0
                                self.minutes = 0
                                self.seconds = 0
                            }
                    }
                }
            }
            
        }
    }
    
    
//    This is such terrible code. I don't know how to do this better though, so it'll do for now.
    
    func timeProsesser() {
        if self.timerRunning {
            if seconds+1 == 60 {
                seconds = 0
                if minutes+1 == 60 {
                    minutes = 0
                    hours += 1
                } else { minutes += 1 }
            } else { seconds += 1 }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}





