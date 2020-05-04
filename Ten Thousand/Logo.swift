//
//  Logo.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/1/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct Logo: View {
    var body: some View {
        VStack {
            ZStack {
                Image("Logo")
                    .frame(width: 44, height: 44)
            }
            Spacer()
        }
    }
}
