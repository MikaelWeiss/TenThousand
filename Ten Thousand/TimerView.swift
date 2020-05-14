//
//  TimerView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    
    @State var showHelpCenter = false
    @State var showAccountView = false
    @State var timerRunning = false
    @State var seconds = 0
    @State var minutes = 0
    @State var hours = 0
    
    
//TODO: Timer stops working when you switch between screens. FIX!
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            VStack {
                Image("Logo")
                    .frame(width: 44, height: 44)
                Spacer()
            }
            VStack {
                HStack {
                    Spacer()
                    Button(action: {self.showAccountView.toggle()}) {
                        Image(systemName: "person.fill")
                        .renderingMode(.original)
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 44, height: 44)
                        .modifier(NavButtons())
                    }
                    .sheet(isPresented: $showAccountView) {
                        AccountView()
                    }
                    
                    Button(action: { self.showHelpCenter.toggle()}) {
                        Image(systemName: "questionmark")
                        .renderingMode(.original)
                        .font(.system(size: 20, weight: .bold))
                        .modifier(NavButtons())
                    }
                    .sheet(isPresented: $showHelpCenter) {
                        HelpCenter()
                     }
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal)
                Spacer()
            }
            
            VStack (spacing: 20) {
                Text("\(hours) : \(minutes) : \(seconds)")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .frame(maxWidth: .infinity)
                    .onReceive(timer) { value in
                        if self.timerRunning {
                            self.seconds += 1
                            if self.seconds == 60 {
                                self.minutes += 1
                                self.seconds = 0
                            }
                            if self.minutes == 60 {
                                self.hours += 1
                                self.minutes = 0
                            }
                        }
                }
                HStack (spacing: 20){
                    Button(action: {self.timerRunning.toggle()}) {
                        Image(systemName: timerRunning ? "pause.fill" : "play.fill")
                    }
                    .modifier(MainButton())
                    Button(action: {self.seconds = 0; self.minutes = 0; self.hours = 0; self.timerRunning = false}) {
                        Image(systemName: "gobackward")
                            .font(.system(size: 16, weight: .heavy))
                    }.modifier(MainButton())
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}



struct Time {
    var hour: Int
    var minute: Int
    var second: Int = 0
}
