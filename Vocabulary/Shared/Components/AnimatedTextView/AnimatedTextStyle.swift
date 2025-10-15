//
//  AnimatedTextStyle.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 28.09.2025.
//

import SwiftUI

// MARK: - Public Structs
/// Style descriptor for animated text: font size, weight, and color.
public struct AnimatedTextStyle {
    public let fontSize: CGFloat
    public let fontWeight: Font.Weight
    public let color: Color

    /// Convenience computed font for this style
    public var font: Font { .system(size: fontSize, weight: fontWeight) }

    /// Preset style for title
    public static let title = AnimatedTextStyle(
        fontSize: 36,
        fontWeight: .black,
        color: .primary
    )

    /// Preset style for subtitle
    public static let subtitle = AnimatedTextStyle(
        fontSize: 18,
        fontWeight: .medium,
        color: .primary
    )

    /// Memberwise initializer
    public init(fontSize: CGFloat, fontWeight: Font.Weight, color: Color) {
        self.fontSize = fontSize
        self.fontWeight = fontWeight
        self.color = color
    }
}
