//
//  MainButton.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

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
