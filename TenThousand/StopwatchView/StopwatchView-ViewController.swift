//
//  Stopwatch-ViewController.swift
//  TenThousand
//
//  Created by Mikael Weiss on 7/15/20.
//  Copyright © 2020 Mikael Weiss. All rights reserved.
//

import SwiftUI

protocol StopwatchViewDisplaying {
    var ViewModel: StopwatchView.ViewModel { get set }
}

protocol StopwatchViewInputing {
    func didTapPause()
    func didTapPlay()
    func didTapSave()
}

struct StopwatchViewController: View, StopwatchViewDisplaying, StopwatchViewInputing {
    @ObservedObject var ViewModel: StopwatchView.ViewModel
    let interactor: StopwatchViewRequesting?
    
    var body: some View {
        ZStack {
            Text("\(ViewModel.currentTime ?? "00:00:00")")
                .font(timerTextFont)
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        self.didTapSave()
                    }) {
                        Image(systemName:
                        (ViewModel.stopwatchState == .paused ?
                         playImage :
                         pauseImage))
                            .renderingMode(.original)
                    }
                    .frame(height: buttonHeight)
                    .frame(maxWidth: .infinity)
                    if ViewModel.canSave {
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
            if self.ViewModel.stopwatchState == .paused {
                self.didTapPause()
            } else {
                self.didTapPlay()
            }
        }
    }

    // MARK: - Inputing
    func didTapPause() {
        interactor?.didTapPause()
    }
    
    func didTapPlay() {
        interactor?.didTapPlay()
    }
    
    func didTapSave() {
        interactor?.saveLog()
    }
    
    // MARK: - Styling/Setup
    let timerTextFont = Font.system(.largeTitle, design: .rounded).weight(.heavy)
    let playImage = "play.circle.fill"
    let pauseImage = "pause.circle.fill"
    let pausePlayImageFont = Font.system(size: 30, weight: .bold)
    let buttonHeight: CGFloat = 44
}

struct StopwatchViewController_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchViewController(ViewModel: StopwatchView.ViewModel(currentTime: nil), interactor: nil)
    }
}
