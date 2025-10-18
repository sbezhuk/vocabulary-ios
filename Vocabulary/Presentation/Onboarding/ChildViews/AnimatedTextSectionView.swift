//
//  AnimatedTextSection.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

private enum Constants {
    static let titleText: String = "Expand Your Vocabulary"
    static let subtitleText: String = "Learn, remember, and use English words effortlessly."

    static let titleFontSize: CGFloat = 36
    static let titleFontWeight: Font.GeologicaFont = .black
    static let titleColor: Color = Color(hex: .lightWhite)

    static let subtitleFontSize: CGFloat = 18
    static let subtitleFontWeight: Font.GeologicaFont = .medium
    static let subtitleColor: Color = Color(hex: .lightWhite)
}

struct AnimatedTextSectionView: View {
    var body: some View {
        AnimatedTextView(
            title: Constants.titleText,
            subtitle: Constants.subtitleText,
            titleStyle: AnimatedTextStyle(
                fontSize: Constants.titleFontSize,
                fontWeight: Constants.titleFontWeight,
                color: Constants.titleColor
            ),
            subtitleStyle: AnimatedTextStyle(
                fontSize: Constants.subtitleFontSize,
                fontWeight: Constants.subtitleFontWeight,
                color: Constants.subtitleColor
            )
        )
    }
}

