//
//  Backgrounds.swift
//  NumberGuesser
//
//  Created by Jesse Taylor on 2024-03-23.
//

import SwiftUI

struct GradientBackground {
    let gradient: LinearGradient
    let name: String
}

//Array of GradientBackgrounds
let gradientBackgrounds: [GradientBackground] = [
    GradientBackground(
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            name: "PurplePink"
        ),
    GradientBackground(
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            name: "GreenBlue"
        ),
    GradientBackground(
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            name: "PurpleBlue"
        ),
    GradientBackground(
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.cyan, Color.pink]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            name: "CyanPink"
        ),
    GradientBackground(
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.yellow, Color.red]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            name: "YellowRed"
        ),
    GradientBackground(
            gradient: LinearGradient(
                gradient: Gradient(colors: [Color.green, Color.orange]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            name: "GreenOrange"
        ),
]
