//
//  SettingsView.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-21.
//

import SwiftUI

struct SettingsView: View {
    @State private var showingThemeSheet = false
    @State private var showingDifficultySheet = false
    @ObservedObject var viewModel : GameViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                BackgroundStyle(viewModel: viewModel)
                
                VStack {
                    Title("Game Settings")
                    
                    Spacer()
                    
                    VStack {
                        
                        ButtonLabelStyle(action: {
                            showingDifficultySheet = true
                        }, title: "Difficulty", sysImage: "flame")
                        
                        .sheet(isPresented: $showingDifficultySheet) {
                            DifficultySelectionSheet(viewModel: viewModel)
                        }
                        
                        ButtonLabelStyle(action: {
                            showingThemeSheet = true
                        }, title: "Theme", sysImage: "paintbrush")
                      
                        .sheet(isPresented: $showingThemeSheet) {
                            BackgroundSelectionSheet(viewModel: viewModel)
                        }
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = GameViewModel()
        SettingsView(viewModel: viewModel)
    }
}
