//
//  NavButtons.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

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
