//
//  GameViewModel.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-21.
//

import SwiftUI

class GameViewModel: ObservableObject {
    @Published var answer: Int = 0
    @Published var selectedBackgroundName: String = "PurplePink"
    @Published var currentDifficulty: GameDifficulty = .easy // Default to easy
    @Published var remainingGuesses: Int = 100

    init() {
        remainingGuesses = currentDifficulty.maxGuesses
        generateNewAnswer()
    }

    func generateNewAnswer() {
        answer = Int.random(in: currentDifficulty.range)
        remainingGuesses = currentDifficulty.maxGuesses // Reset guesses on new answer
    }

    func changeDifficulty(to newDifficulty: GameDifficulty) {
        currentDifficulty = newDifficulty
        generateNewAnswer() // Regenerate answer with new difficulty settings
    }
    
    func getRange() -> String {
        switch currentDifficulty {
        case .easy:
            return "1-100"
        case .medium:
            return "1-200"
        case .hard:
            return "1-300"
        case .expert:
            return "1-500"
        }
    }
}


//View to show previous guesses
struct PreviousGuesses: View {
    var guesses: [Int] = []
    let answer: Int
    
    var body: some View {
        ScrollView {
            ForEach(guesses, id: \.self) { guess in
                HStack {
                    if guess == answer {
                        GuessStyle(guess: guess, sysName: "checkmark.square")
                    } else if guess > answer {
                        GuessStyle(guess: guess, sysName: "arrowshape.down")
                    } else if guess < answer {
                        GuessStyle(guess: guess, sysName: "arrowshape.up")
                    }
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            }
        }
    }
}
