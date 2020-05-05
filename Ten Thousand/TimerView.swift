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
                    Image(systemName: "person.fill")
                        .font(.system(size: 20, weight: .bold))
                        .frame(width: 44, height: 44)
                        .background(Color.white)
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                    Button(action: { self.showHelpCenter.toggle()}) {
                        Image(systemName: "questionmark")
                            .renderingMode(.original)
                            .font(.system(size: 20, weight: .bold))
                            .frame(width: 44, height: 44)
                            .background(Color.white)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
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
                Text("00:00:00")
                    .font(.custom("SFProRounded-Bold", size: 40))
                    .frame(maxWidth: .infinity)
                    .padding(.bottom, 10)
                HStack {
                    blueButton(image: timerRunning ? "pause.fill" : "play.fill")
                    blueButton(image: "pause.fill")
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


struct blueButton: View {
    
    var image: String
    
    
    var body: some View {
        Button(action: {}) {
            Image(systemName: image)
        }
        .frame(width: 44, height: 44)
        .foregroundColor(.white)
        .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.1960784314, green: 0.7725490196, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1))]), startPoint: .trailing, endPoint: .leading))
        .clipShape(Circle())
        .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
    }
}
