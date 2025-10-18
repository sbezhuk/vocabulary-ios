//
//  TermsText.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

private enum Constants {
    static let titleText: String = "Please take a moment to read our Terms and Conditions before use"
    
    static let titleFontSize: CGFloat = 14
    static let titleFontWeight: Font.GeologicaFont = .light
    static let titleColor: Color = Color(hex: .lightWhite)
}

struct TermsTextView: View {
    var body: some View {
        Text(Constants.titleText)
            .font(Font.geologica(Constants.titleFontWeight, size: Constants.titleFontSize))
            .foregroundColor(Constants.titleColor)
            .multilineTextAlignment(.center)
    }
}

