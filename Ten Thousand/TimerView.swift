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
            
            VStack {
                Text("Does")
                    .font(.custom("SF-Pro-Rounded-Medium", size: 40))     //Not working. I don't know why.
                    .font(.system(size: 40, weight: .bold))
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                HStack (spacing: 20){
                    Button(action: {self.timerRunning.toggle()}) {
                        Image(systemName: timerRunning ? "pause.fill" : "play.fill")
                    }.modifier(MainButton())
                    Button(action: {}) {
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



struct MainButton: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(width: 50, height: 50)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784314, green: 0.7725490196, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))]), startPoint: .trailing, endPoint: .leading))
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}

struct NavButtons: ViewModifier {
    func body(content: Content) -> some View {
        content
        .frame(width: 44, height: 44)
        .background(Color.white)
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
