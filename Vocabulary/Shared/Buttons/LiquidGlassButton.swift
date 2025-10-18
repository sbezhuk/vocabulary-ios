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
    let buttonSize: CGFloat
    let iconColor: Color
    let action: () -> Void

    // MARK: - Initializers (overloaded for clarity)
    /// Designated initializer with full control.
    init(systemImage: String, iconColor: Color, buttonSize: CGFloat, action: @escaping () -> Void) {
        self.systemImage = systemImage
        self.iconColor = iconColor
        self.action = action
        self.buttonSize = buttonSize
    }

    /// Convenience: custom image and size, default color.
    init(systemImage: String, buttonSize: CGFloat, action: @escaping () -> Void) {
        self.init(
            systemImage: systemImage,
            iconColor: Color(hex: .lightWhite),
            buttonSize: buttonSize,
            action: action
        )
    }

    /// Convenience: defaults for image, color and size.
    init(action: @escaping () -> Void) {
        self.init(
            systemImage: "arrow.right",
            iconColor: Color(hex: .lightWhite),
            buttonSize: Constants.buttonSize,
            action: action
        )
    }

    // MARK: - Body
    var body: some View {
        Button(action: action) {
            Image(systemName: systemImage)
                .font(
                    .system(
                        size: buttonSize * Constants.iconScaleFactor,
                        weight: .medium
                    )
                )
                .foregroundStyle(iconColor)
        }
        .buttonStyle(
            LiquidGlassButtonStyle(
                size: buttonSize,
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
