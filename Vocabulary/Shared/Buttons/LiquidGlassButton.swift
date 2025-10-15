//
//  LiquidGlassButton.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 28.09.2025.
//

import SwiftUI

// MARK: - Fixed constants
private enum Constants {
    static let buttonSize: CGFloat = 80
    static let pressedScale: CGFloat = 0.95
    static let feedbackIntensity: CGFloat = 0.7
    static let iconScaleFactor: CGFloat = 0.35
}


/// A circular button styled with a liquid glass effect.
struct LiquidGlassButton: View {
    // MARK: - Public configuration
    let systemImage: String
    let iconColor: Color
    let action: () -> Void

    // MARK: - Initializer
    init(
        systemImage: String = "arrow.right",
        iconColor: Color = .black.opacity(0.65),
        action: @escaping () -> Void
    ) {
        self.systemImage = systemImage
        self.iconColor = iconColor
        self.action = action
    }

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(
                    .system(
                        size: Constants.buttonSize * Constants.iconScaleFactor,
                        weight: .medium
                    )
                )
                .foregroundStyle(iconColor)
        }
        .buttonStyle(
            LiquidGlassButtonStyle(
                size: Constants.buttonSize,
                pressedScale: Constants.pressedScale,
                feedbackIntensity: Constants.feedbackIntensity
            )
        )
    }
}

// MARK: - Private ButtonStyle
private struct LiquidGlassButtonStyle: ButtonStyle {
    let size: CGFloat
    let pressedScale: CGFloat
    let feedbackIntensity: CGFloat

    @ViewBuilder
    func makeBody(configuration: Configuration) -> some View {
        core(configuration.label, isPressed: configuration.isPressed)
            .sensoryFeedback(
                .impact(intensity: feedbackIntensity),
                trigger: configuration.isPressed
            )
    }

    private func core(_ label: Configuration.Label, isPressed: Bool) -> some View {
        label
            .frame(width: size, height: size)
            .clipShape(Circle())
            .glassEffect(.clear)
            .contentShape(Circle())
            .scaleEffect(isPressed ? pressedScale : 1.0)
            .animation(.easeInOut(duration: 0.1), value: isPressed)
    }
}

// MARK: - Previews
#Preview("Default") {
    ZStack {
        Color.black.ignoresSafeArea()
        LiquidGlassButton { }
    }
}

#Preview("Custom icon color") {
    ZStack {
        Color.black.ignoresSafeArea()
        LiquidGlassButton(
            systemImage: "bolt.fill",
            iconColor: .white.opacity(0.9)
        ) {
            // action
        }
    }
}
