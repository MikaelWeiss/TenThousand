//
//  TabView.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/23/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct RootTabView: View {
    @EnvironmentObject var stopwatch: Stopwatch
    
    var body: some View {
        TabView {
            ViewStopwatch.Scene(stopwatch: stopwatch).viewController
            .tabItem {
                Image(systemName: "stopwatch")
                Text("Stopwatch")
            }
        }
    }
}

struct RootTabView_Previews: PreviewProvider {
    static var previews: some View {
        RootTabView().environmentObject(Stopwatch())
    }
}
