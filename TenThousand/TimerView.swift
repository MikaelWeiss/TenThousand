//
//  TimerView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct TimerView: View {
    @EnvironmentObject var userSettings: UserSettings
    @State private var showHelpCenter = false
    @State private var showAccountView = false
    @ObservedObject var stopwatch: StopWatch
    
//TODO: Timer stops working when you switch between screens. FIX!
    
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
                        if userSettings.profilePicture == nil {
                            Image(systemName: "person.fill")
                                .renderingMode(.original)
                                .font(.system(size: 20, weight: .bold))
                                .frame(width: 44, height: 44)
                                .modifier(NavButtons())
                        } else {
                            userSettings.profilePicture!
                                .renderingMode(.original)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 44, height: 44)
                                .clipShape(Circle())
                                .modifier(NavButtons())
                        }
                    }
                    .sheet(isPresented: $showAccountView) {
                        AccountView().environmentObject(self.userSettings)
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
                Text(stopwatch.observedTimeAsString)
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .frame(maxWidth: .infinity)
                HStack (spacing: 20){
                    Button(action: {
                        if stopwatch.observedIsPaused == true {
                            stopwatch.play()
                        } else {
                            stopwatch.pause()
                        }
                    }) {
                        Image(systemName: stopwatch.observedIsPaused ? "play.fill" : "pause.fill")
                            .font(.system(size: 16, weight: .heavy))
                            .frame(minWidth: 44, minHeight: 44)
                    }
                    .modifier(MainButton())
                    Button(action: {
                        _ = stopwatch.getImportantInfoToSave()
                        stopwatch.reset()
                        //save a new log
                         } )  {
                        Image(systemName: "gobackward")
                            .font(.system(size: 16, weight: .heavy))
                            .frame(minWidth: 44, minHeight: 44)
                    }.modifier(MainButton())
                }
            }
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(stopwatch: StopWatch())
            .environmentObject(UserSettings())
    }
}
