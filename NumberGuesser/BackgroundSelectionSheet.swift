//
//  BackgroundSelectionSheet.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-23.
//

import SwiftUI

struct BackgroundSelectionSheet: View {
    @ObservedObject var viewModel: GameViewModel //Use Game Model
    let backgrounds = gradientBackgrounds
    
    var body: some View {
        //Columns for grid
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(backgrounds, id: \.name) { background in
                    TinyBackground(gradient: background)
                        .onTapGesture {
                            //Update Selected Background
                            viewModel.selectedBackgroundName = background.name
                        }
                }
            }
        }
        .background(.black)
    }
}

struct TinyBackground: View {
    var gradient: GradientBackground
    
    var body: some View {
        VStack {
            gradient.gradient
                .ignoresSafeArea()
                .frame(width: 150, height: 200)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)))
                .padding()
        }
    }
}

//struct BackgroundSelectionSheet_Previews: PreviewProvider {
//    @State static var selectedBackgroundName = "Pink Sunset" //Example for preview
//    
//    static var previews: some View {
//        BackgroundSelectionSheet(selectedBackgroundName: $selectedBackgroundName)
//    }
//}
