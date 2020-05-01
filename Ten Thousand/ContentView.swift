//
//  ContentView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 4/29/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            Logo()
            VStack {
                Text("Ten Thousand")
                    .font(.custom("AvenirNext-DemiBold", size: 50))
                    .foregroundColor(Color(#colorLiteral(red: 0.4862297773, green: 0.4863032103, blue: 0.4862136245, alpha: 1)))
                Text("\"Time abides long enough for those who make use of it.\"")           .foregroundColor(Color(#colorLiteral(red: 0.2744825482, green: 0.2745271921, blue: 0.2744727135, alpha: 1)))
                    .multilineTextAlignment(.center)
                HStack {
                    Spacer()
                    Text("- Leanardo da Vinci")
                        .foregroundColor(Color(#colorLiteral(red: 0.2744825482, green: 0.2745271921, blue: 0.2744727135, alpha: 1)))
                        .padding(.trailing, 20)
                }
                StopwatchImage()
                Spacer()
            }
            .font(.custom("AvenirNext-DemiBold", size: 20))
            .padding(.top, 45)
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        
    }
}


struct StopwatchImage: View {
    var body: some View {
        ZStack (alignment: .center){
            Rectangle().frame(width: 311, height: 311)
                .cornerRadius(24)
            Image("Stopwatch")
            Text("Photo by Andrik Langfield on Unsplash")
                .font(.custom("AvenirNext-DemiBold", size: 10))
                .offset(x: 55, y: 140)
                .opacity(0.4)
            
        }.shadow(radius: 10, x: 10, y: 10)
    }
}
