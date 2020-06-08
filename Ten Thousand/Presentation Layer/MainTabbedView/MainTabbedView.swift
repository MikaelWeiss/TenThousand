//
//  MainTabbedView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 6/8/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct MainTabbedView: View
{
    
    var body: some View
    {
        TabView()
        {
            
            Text("Tab Content 1").tabItem
            {
                VStack
                {
                    Image(systemName: "clock")
                        .font(.system(size: 16, weight: .semibold))
                        .imageScale(.large)
                    
                    Text("Timer")
                        .fontWeight(.semibold)
                }
                
            }.tag(1)
            
            Text("Tab Content 2").tabItem
            {
                VStack
                {
                    Image(systemName: "list.bullet")
                        .font(.system(size: 16, weight: .semibold))
                        .imageScale(.large)
                    
                    Text("Logs")
                        .fontWeight(.semibold)
                }
                
            }.tag(2)
        }
    }
}

struct MainTabbedView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabbedView()
    }
}
