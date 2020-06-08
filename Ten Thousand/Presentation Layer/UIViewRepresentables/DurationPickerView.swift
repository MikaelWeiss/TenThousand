//
//  DurationPickerView.swift
//  Ten Thousand
//
//  Created by Mikael Weiss on 5/6/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI
import UIKit

struct DurationPickerView: UIViewRepresentable {
//    @Binding var time: Time

    func makeCoordinator() -> DurationPickerView.Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UIDatePicker {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .countDownTimer
        datePicker.addTarget(context.coordinator, action: #selector(Coordinator.onDateChanged), for: .valueChanged)
        return datePicker
    }

    func updateUIView(_ datePicker: UIDatePicker, context: Context) {
//        let date = Calendar.current.date(bySettingHour: time.hour, minute: time.minute, second: time.second, of: datePicker.date)!
//        datePicker.setDate(date, animated: true)
    }

    class Coordinator: NSObject {
        var durationPicker: DurationPickerView

        init(_ durationPicker: DurationPickerView) {
            self.durationPicker = durationPicker
        }

        @objc func onDateChanged(sender: UIDatePicker) {
            print(sender.date)
//            let calendar = Calendar.current
//            let date = sender.date
//            durationPicker.time = Time(hour: calendar.component(.hour, from: date), minute: calendar.component(.minute, from: date), second: calendar.component(.second, from: date))
        }
    }
}
