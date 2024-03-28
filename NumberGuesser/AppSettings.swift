//
//  AppSettings.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-23.
//

import Foundation
import SwiftUI

class AppSettings: ObservableObject {
    @Published var backgroundColor: Color = .black
}

enum GameDifficulty {
    case easy, medium, hard, expert

    var range: ClosedRange<Int> {
        switch self {
        case .easy:
            return 1...100
        case .medium:
            return 1...200
        case .hard:
            return 1...300
        case .expert:
            return 1...500
        }
    }

    var maxGuesses: Int {
        switch self {
        case .easy:
            return 10
        case .medium:
            return 8
        case .hard:
            return 6
        case .expert:
            return 5
        }
    }
}

