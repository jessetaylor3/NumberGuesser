//
//  Styles.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-21.
//

import SwiftUI

struct Styles: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct BackgroundStyle: View {
    @ObservedObject var viewModel: GameViewModel

    var body: some View {
        // Attempt to find the gradient that matches the selectedBackgroundName
        let selectedGradient = gradientBackgrounds.first { $0.name == viewModel.selectedBackgroundName }?.gradient
            // Provide a default LinearGradient if no match is found
            ?? LinearGradient(gradient: Gradient(colors: [Color.purple, Color.pink]), startPoint: .topLeading, endPoint: .bottomTrailing)

        // Apply the selected or default LinearGradient
        selectedGradient
            .ignoresSafeArea()
    }
}

struct CapsuleText: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 40).bold())
            .foregroundStyle(.black)
            .frame(maxWidth: 200)
            .background(.background.opacity(0.3))
            .clipShape(Capsule())
            .padding()
    }
}

struct Title: View {
    var title: String
    
    //If you want to define a struct with an unnamed parameter in swiftUI
    init(_ title: String) {
        self.title = title
    }
    
    var body: some View {
        Text(title)
            .font(.system(size: 32).bold())
            .foregroundStyle(.black)
            .padding()
    }
}

struct LabelStyle: View {
    var title: String
    var sysImage: String
    
    var body: some View {
       Label(title, systemImage: sysImage)
            .font(.system(size: 24).bold())
            .foregroundStyle(.black)
            .frame(maxWidth: 200, maxHeight: 50)
    }
}

struct ButtonLabelStyle: View {
    let action: () -> Void
    let title: String
    let sysImage: String
    
    var body: some View {
        Button(action: action){
            LabelStyle(title: title, sysImage: sysImage)
        }
    }
}

struct GuessInputStyle: View {
    @Binding var guess: String
    
    var body: some View {
        TextField("", text: $guess)
            .keyboardType(.numberPad)
            .font(.system(size: 40).bold())
            .foregroundStyle(.black)
            .multilineTextAlignment(.center)
            .frame(maxWidth: 150)
            .background(.background.opacity(0.3))
            .clipShape(Capsule())
            .padding()
            .toolbar {
                // Toolbar item group placed at the bottom of the screen (keyboard's top)
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer() // Use Spacer to push the Done button to the right
                    Button("Done") {
                        // Dismiss the keyboard
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    }
                }
            }
    }
}

struct GuessStyle: View {
    var guess: Int
    var sysName: String
    
    var body: some View {
        Text("\(guess)")
            .font(.system(size: 40).bold())
            .foregroundStyle(.black)
        Image(systemName: sysName)
            .resizable()
            .frame(width: 35, height: 35)
            .bold()
            .foregroundStyle(.black)
    }
}

//struct Styles_Previews: PreviewProvider {
//    let viewModel = GameViewModel()
//    
//    static var previews: some View {
//        BackgroundStyle(viewModel: viewModel)
//    }
//}
