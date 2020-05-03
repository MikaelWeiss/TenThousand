//
//  TabbedMainView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/2/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct TabbedMainView: View {
    var body: some View {
        TabView {
            TimerView()
                .tabItem {
                    Image(systemName: "stopwatch")
                        .font(.system(size: 20, weight: .bold))
                    Text("Timer")
            }
            LogView()
                .tabItem {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 20, weight: .bold))
                    Text("Logs")
            }
        }
    }
}

struct TabbedMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabbedMainView()
    }
}
