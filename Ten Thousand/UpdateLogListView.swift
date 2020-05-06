//
//  UpdateLogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct UpdateLogListView: View {
    @State var time = Time(hour: 1, minute: 1)
    
    
    var body: some View {
        DurationPickerView(time: $time)
    }
}

struct UpdateLogListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateLogListView()
    }
}



