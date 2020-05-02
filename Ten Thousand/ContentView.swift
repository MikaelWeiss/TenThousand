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
                Text("\"Time abides long enough for those who make use of it.\"")
                    .foregroundColor(Color(#colorLiteral(red: 0.2744825482, green: 0.2745271921, blue: 0.2744727135, alpha: 1)))
                    .multilineTextAlignment(.center)
                HStack {
                    Spacer()
                    Text("- Leanardo da Vinci")
                        .foregroundColor(Color(#colorLiteral(red: 0.2744825482, green: 0.2745271921, blue: 0.2744727135, alpha: 1)))
                        .padding(.trailing, 20)
                }
                StopwatchImage()
                Spacer()
                ActionButton(title: "Get Started", hight: 54, width: 335, fontSize: 30)
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


struct ActionButton: View {
    var buttonName: String
    var buttonHight: CGFloat
    var buttonWidth: CGFloat
    var fontSize: CGFloat
    
    var body: some View {
        Button(action: {
            //Where to add the action
            
            
            
        }) {
            Text(buttonName)
                .font(.custom("Impact", size: fontSize))
                .foregroundColor(Color.white)
                .opacity(0.85)
                .frame(width: 335.0, height: 54.0)
                .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.1960784314, green: 0.7725490196, blue: 1, alpha: 1))]), startPoint: .bottomLeading, endPoint: .topTrailing))
                .cornerRadius(27)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)), radius: 5, x: 0, y: 4)
        }
    }
    
    init(title: String, hight: CGFloat, width: CGFloat, fontSize: CGFloat) {
        buttonName = title
        buttonHight = hight
        buttonWidth = width
        self.fontSize = fontSize
    }
}
