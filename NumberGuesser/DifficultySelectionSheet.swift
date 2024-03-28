//
//  DifficultySelectionSheet.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-24.
//

import SwiftUI

struct DifficultySelectionSheet: View {
    @ObservedObject var viewModel: GameViewModel
    
    var body: some View {
        ZStack {
            BackgroundStyle(viewModel: viewModel)
            
            VStack {
                Title("Choose Your Difficulty")
                Spacer()
                VStack {
                    HStack {
                        ButtonLabelStyle(action: {
                            viewModel.changeDifficulty(to: .easy)
                        }, title: "Easy", sysImage: viewModel.currentDifficulty == .easy ? "circle.fill" : "circle")
                        
                        ButtonLabelStyle(action: {
                            viewModel.changeDifficulty(to: .hard)
                        }, title: "Hard", sysImage: viewModel.currentDifficulty == .hard ? "circle.fill" : "circle")
                    }
                    
                    HStack {
                        ButtonLabelStyle(action: {
                            viewModel.changeDifficulty(to: .medium)
                        }, title: "Medium", sysImage: viewModel.currentDifficulty == .medium ? "circle.fill" : "circle")
                        
                        ButtonLabelStyle(action: {
                            viewModel.changeDifficulty(to: .expert)
                        }, title: "Expert", sysImage: viewModel.currentDifficulty == .expert ? "circle.fill" : "circle")
                    }
                }
            }
        }
    }
}

struct DifficultySelectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = GameViewModel()
        
        DifficultySelectionSheet(viewModel: viewModel)
    }
}

