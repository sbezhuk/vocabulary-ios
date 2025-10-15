//
//  AnimatedTextView.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 28.09.2025.
//

import SwiftUI

// MARK: - Constants
private enum Constants {
    static let animationDuration: Double = 1.0
    static let titleDelay: Double = 0.0
    static let subtitleDelay: Double = 0.3
    static let offsetDistance: CGFloat = 20
    static let contentPadding = EdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 100)
    static let subtitleTopPadding: CGFloat = 4
}

// MARK: - Public Structs
/// Component that displays a title and optional subtitle with a smooth appearance animation.
struct AnimatedTextView: View {
    let title: String
    let subtitle: String?
    let titleStyle: AnimatedTextStyle
    let subtitleStyle: AnimatedTextStyle
    let animation: Animation

    @State private var showText = false

    init(
        title: String,
        subtitle: String? = nil,
        titleStyle: AnimatedTextStyle = .title,
        subtitleStyle: AnimatedTextStyle = .subtitle,
        animation: Animation = .easeOut(duration: Constants.animationDuration)
    ) {
        self.title = title
        self.subtitle = subtitle
        self.titleStyle = titleStyle
        self.subtitleStyle = subtitleStyle
        self.animation = animation
    }

    var body: some View {
        VStack(alignment: .leading) {
            titleText()

            if let subtitle, !subtitle.isEmpty {
                subtitleText(subtitle)
            }
        }
        .padding(.leading, Constants.contentPadding.leading)
        .padding(.trailing, Constants.contentPadding.trailing)
        .onAppear {
            showText = true
        }
    }
    
    // MARK: - Private Methods
    private func titleText() -> some View {
        Text(title)
            .font(titleStyle.font)
            .foregroundColor(titleStyle.color)
            .opacity(showText ? 1 : 0)
            .offset(y: showText ? 0 : Constants.offsetDistance)
            .animation(animation.delay(Constants.titleDelay), value: showText)
            .layoutPriority(1)
    }

    private func subtitleText(_ text: String) -> some View {
        Text(text)
            .font(subtitleStyle.font)
            .foregroundColor(subtitleStyle.color)
            .padding(.top, Constants.subtitleTopPadding)
            .opacity(showText ? 1 : 0)
            .offset(y: showText ? 0 : Constants.offsetDistance)
            .animation(animation.delay(Constants.subtitleDelay), value: showText)
    }
}

// MARK: - Preview
#Preview {
    VStack(spacing: 50) {
        AnimatedTextView(
            title: "Privacy stays private",
            subtitle: "Only you decide who can access your information."
        )

        AnimatedTextView(
            title: "Custom Style",
            subtitle: "With different colors and fonts.",
            titleStyle: AnimatedTextStyle(
                fontSize: 28,
                fontWeight: .bold,
                color: .blue
            ),
            subtitleStyle: AnimatedTextStyle(
                fontSize: 16,
                fontWeight: .regular,
                color: .gray
            )
        )

        // Example with custom animation
        AnimatedTextView(
            title: "Configurable Animation",
            subtitle: "This uses a spring animation.",
            animation: .spring(response: 0.6, dampingFraction: 0.8)
        )
    }
    .padding()
    .dynamicTypeSize(.accessibility3)
}
