//
//  AnimatedTextStyle.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 28.09.2025.
//

import SwiftUI

// MARK: - Public Structs
/// Style descriptor for animated text: font size, weight, and color.
struct AnimatedTextStyle {
    let fontSize: CGFloat
    let fontWeight: Font.GeologicaFont
    let color: Color

    /// Convenience computed font for this style
    var font: Font { Font.geologica(fontWeight, size: fontSize) }

    /// Preset style for title
    static let title = AnimatedTextStyle(
        fontSize: 36,
        fontWeight: .black,
        color: .primary
    )

    /// Preset style for subtitle
    static let subtitle = AnimatedTextStyle(
        fontSize: 18,
        fontWeight: .medium,
        color: .primary
    )

    /// Memberwise initializer
    init(fontSize: CGFloat, fontWeight: Font.GeologicaFont, color: Color) {
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.color = color
    }
}

