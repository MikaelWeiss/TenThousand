//
//  MainTabbedView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct MainTabbedView: View {
    @EnvironmentObject var userSettings: UserSettings
    
    var body: some View {
        TabView() {
            TimerView()
                .tabItem {
                    VStack {
                        Image(systemName: "clock")
                            .font(.system(size: 16, weight: .semibold))
                            .imageScale(.large)
                        Text("Timer")
                    }
                    
            }.tag(1)
                
            LogListView()
                .tabItem {
                    VStack {
                        Image(systemName: "list.bullet")
                            .font(.system(size: 16, weight: .semibold))
                            .imageScale(.large)
                        Text("Logs")
                    }
                    
            }.tag(2)
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView().environmentObject(UserSettings())
    }
}
