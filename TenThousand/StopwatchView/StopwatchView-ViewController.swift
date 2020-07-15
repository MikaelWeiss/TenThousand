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
            Rectangle().edgesIgnoringSafeArea(.all)
            Text("\(ViewModel.currentTime ?? "00:00:00")")
                .font(timerTextFont)
            ZStack {
                Spacer()
                HStack {
                    Image(systemName:
                       (ViewModel.stopwatchState == .paused ?
                        playImage :
                        pauseImage)
                    )
                        .font(pausePlayImageFont)
                    if ViewModel.canSave {
                        Button(action: {
                            self.didTapSave()
                        }) {
                            Circle()
                            .overlay(
                                Text(saveButtonTitle)
                                    .font(saveButtonFont)
                            )
                        }
                        .frame(width: saveButtonDemensions.width, height: saveButtonDemensions.height)
                    }
                }
            }
        }
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
    let timerTextFont = StopwatchView.Styles.timerTextFont
    let playImage = StopwatchView.Images.playImage
    let pauseImage = StopwatchView.Images.pauseImage
    let pausePlayImageFont = StopwatchView.Styles.pausePlayImageFont
    let saveButtonTitle = StopwatchView.Strings.saveButtonTitle
    let saveButtonFont = StopwatchView.Styles.saveButtonFont
    let saveButtonDemensions: (width: CGFloat, height: CGFloat) = (width: 44, height: 44)
}

struct StopwatchViewController_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchViewController(ViewModel: StopwatchView.ViewModel(currentTime: nil), interactor: nil)
    }
}
