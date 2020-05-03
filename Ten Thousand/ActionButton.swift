//
//  ActionButton.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/2/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct ActionButton: View {
    var buttonName: String
    var buttonHight: CGFloat
    var buttonWidth: CGFloat
    var fontSize: CGFloat
    
    var body: some View {
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



