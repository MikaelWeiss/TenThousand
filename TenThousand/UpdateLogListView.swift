//
//  UpdateLogListView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/4/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

struct UpdateLogListView: View {
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    @State private var selectedMonthIndex = Calendar.current.component(.month, from: Date()) - 1
    @State private var selectedDayIndex = Calendar.current.component(.day, from: Date()) - 1
    @State private var selectedYearIndex = Calendar.current.component(.year, from: Date()) - 3
    @State private var fakeSelection = 0
    
    var body: some View {
        HStack(spacing: 0) {
            
            LableForInPicker(lable: "Month", width: 80)
            
            Picker("Month", selection: $selectedMonthIndex) {
                ForEach (0..<months.count) {
                    Text(self.months[$0])
                }
            }
            .labelsHidden()
            .frame(width: 40)
            .clipped()
            
            LableForInPicker(lable: " Day", width: 45)
            
            Picker("Month", selection: $selectedDayIndex) {
                ForEach (findDaysInMonth(selectedMonthIndex)) {
                    Text("\($0)")
                }
            }
            .labelsHidden()
            .frame(width: 40)
            .clipped()
            
            LableForInPicker(lable: "Year", width: 40)
            
            Picker("Month", selection: $selectedYearIndex) {
                ForEach (2010..<Calendar.current.component(.year, from: Date()) + 1) {
                    Text("\($0)")
                }
            }
            .labelsHidden()
            .frame(width: 80)
            .clipped()
            
        }
    }
}

func findDaysInMonth(_ index: Int) -> Range<Int> {
    switch index {
    case 3,5,8,10:
        return 1..<31
    case 1:
        return 1..<30
    default:
        return 1..<32
    }
}

struct UpdateLogListView_Previews: PreviewProvider {
    static var previews: some View {
        UpdateLogListView()
    }
}




struct LableForInPicker: View {
    let lable: String
    let width: Int
    
    var body: some View {
        ZStack {
            Picker("", selection: .constant(0)) {
                Text(" ")
                    .bold()
            }
            .labelsHidden()
            .frame(width: CGFloat(width))
            .clipped()
            
            Text("\(lable)")
                .font(.system(size: 19, weight: .bold, design: .rounded))
        }
        .accessibility(hidden: true)
    }
}
