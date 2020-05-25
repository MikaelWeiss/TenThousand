//
//  MainTabbedView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

let defaults = UserDefaults.standard


struct MainTabbedView: View {
    var body: some View {
        TabView() {
        TimerView()
            .tabItem {
                
                Image(systemName: "clock")
                    .font(.system(size: 16, weight: .semibold))
                    .imageScale(.large)
                
        }.tag(1)
        LogListView()
            .tabItem {
                Image(systemName: "list.bullet")
                .font(.system(size: 16, weight: .semibold))
                .imageScale(.large)
                
        }.tag(2)
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
