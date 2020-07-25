//
//  Stopwatch-ViewController.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

protocol ViewStopwatchDisplaying {
    var viewModel: ViewStopwatch.ViewModel { get }
}

protocol ViewStopwatchInputing {
    func didToggleStopwatchState()
    func didTapSave()
}

struct ViewStopwatchViewController: View, ViewStopwatchDisplaying, ViewStopwatchInputing {
    @ObservedObject var viewModel: ViewStopwatch.ViewModel
    let interactor: ViewStopwatchRequesting
    
    var body: some View {
        ZStack {
            Text("\(viewModel.stopwatch.observedString)")
                .font(timerTextFont)
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        self.didToggleStopwatchState()
                    }) {
                        Image(systemName:
                        (viewModel.stopwatch.isPaused ?
                         playImage :
                         pauseImage))
                            .renderingMode(.original)
                    }
                    .frame(height: buttonHeight)
                    .frame(maxWidth: .infinity)
                    if viewModel.canSave {
                        Button(action: {
                            self.didTapSave()
                        }) {
                            Image(systemName: "square.and.pencil")
                                .renderingMode(.original)
                        }
                        .frame(height: buttonHeight)
                        .frame(maxWidth: .infinity)
                    }
                }
            }
        }
        .font(pausePlayImageFont)
        .onTapGesture {
            self.didToggleStopwatchState()
        }
    }

    // MARK: - Inputing
    func didToggleStopwatchState() {
        interactor.didToggleStopwatchState()
    }
    
    func didTapSave() {
        interactor.saveLog()
    }
    
    // MARK: - Drawing Constants
    private let timerTextFont = Font.system(.largeTitle, design: .rounded).weight(.heavy)
    private let playImage = "play.circle.fill"
    private let pauseImage = "pause.circle.fill"
    private let pausePlayImageFont = Font.system(size: 30, weight: .bold)
    private let buttonHeight: CGFloat = 44
}

//struct StopwatchViewController_Previews: PreviewProvider {
//    static var previews: some View {
//        ViewStopwatchViewController(viewModel: ViewStopwatch.ViewModel(), interactor: nil)
//    }
//}
