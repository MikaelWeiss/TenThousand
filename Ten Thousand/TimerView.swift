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
            
            Text("00:00:00")
                // not applying the correct font. I don't know why though. I'll figure this out later.
                .font(.custom("SFProRounded-Medium", size: 40))
            
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

