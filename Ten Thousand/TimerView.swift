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
//    @ObservedObject var timer = Timer()
    @State private var showHelpCenter = false
    @State private var showAccountView = false
    @State private var timerRunning: Bool = false
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
                Text("")
                    .font(.system(size: 40, weight: .heavy, design: .rounded))
                    .frame(maxWidth: .infinity)
                HStack (spacing: 20){
                    Button(action: {self.timerRunning.toggle()}) {
                        Image(systemName: timerRunning ? "pause.fill" : "play.fill")
                    }
                    .modifier(MainButton())
                    Button(action: {
                         //Save time/reset time
                         } )  {
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
        TimerView().environmentObject(UserSettings())
    }
}
