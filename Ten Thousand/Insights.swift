//
//  Insights.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct Insights: View {
    var body: some View {
        List ((0 ... 10), id: \.self) {
            Text("Row \($0)")
        }
        .offset(y: 200)
        .border(Color.blue, width: 3)
    }
}

struct Insights_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            List ((0 ... 10), id: \.self) {
                Text("Row \($0)")
            }
            .offset(y: 200)
            .border(Color.blue, width: 3)
            .background(Color.black)
            
            ScrollView {
                Text("Text")
            }
            .foregroundColor(.white)
            .offset(y: 200)
            .border(Color.blue, width: 3)
            .background(Color.black)
            
            Form {
                Text("Text")
            }
            .offset(y: 200)
            .border(Color.blue, width: 3)
            .background(Color.black)
        }
    }
    init() {
        UIScrollView.appearance().clipsToBounds = false
    }
}
