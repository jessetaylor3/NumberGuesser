//
//  ContentView.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-21.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var gameViewModel = GameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundStyle(viewModel: gameViewModel)
                
                VStack {
                    Title("Number Guesser")
                    
                    Spacer()
                    
                    NavigationLink(destination: GameView(guess: "", viewModel: gameViewModel, attempts: gameViewModel.currentDifficulty.maxGuesses)) {
                        LabelStyle(title: "Play Game", sysImage: "play.circle")
                    }
                    NavigationLink(destination: SettingsView(viewModel: gameViewModel)) {
                        LabelStyle(title: "Settings", sysImage: "gearshape")
                    }
                }
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
