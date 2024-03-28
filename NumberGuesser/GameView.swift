//
//  GameView.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-21.
//

import SwiftUI

struct GameView: View {
    @State var guess: String
    @State var guesses: [Int] = []
    @ObservedObject var viewModel: GameViewModel
    @State var attempts: Int
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundStyle(viewModel: viewModel)
                
                VStack {
                    CapsuleText(viewModel.getRange())
                    CapsuleText(String(attempts))
                    
                    PreviousGuesses(guesses: guesses, answer: viewModel.answer)
                    
                    Spacer()
                    
                    HStack {
                        GuessInputStyle(guess: $guess)
                        
                        Button {
                            if let userInput = Int(guess) {
                                if userInput == viewModel.answer {
                                    //TODO: Popup with game over?
                                    print("You did it")
                                }
                                attempts -= 1
                                guesses.append(userInput)
                                guess = ""
                                
                            } else {
                                print("Error making guess")
                            }
                        } label: {
                            Image(systemName: "plus.circle.fill")
                                .resizable()
                                .frame(width: 45, height: 45)
                                .foregroundStyle(.background.opacity(0.4))
                        }
                    }
                }
            }
            .onAppear() {
                viewModel.generateNewAnswer()
            }
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        //Instance of GameViewModel for preview purposes
        let viewModel = GameViewModel()
        
        GameView(guess: "50", viewModel: viewModel, attempts: 5)
    }
}


