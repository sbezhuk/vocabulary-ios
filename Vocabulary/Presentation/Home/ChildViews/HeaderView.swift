//
//  HeaderView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

private enum Constants {
    static let titleText: String = "Home"
    static let titleFontSize: CGFloat = 32
    static let titleFontWeight: Font.GeologicaFont = .bold
    static let titleColor: Color = Color(hex: .lightWhite)

    static let buttonSystemImage: String = "plus"
    static let buttonSize: CGFloat = 50

    static let horizontalPadding: CGFloat = 24
}

struct HeaderView: View {
    let action: () -> Void
    
    var body: some View {
        HStack {
            Text(Constants.titleText)
                .font(Font.geologica(Constants.titleFontWeight, size: Constants.titleFontSize))
                .foregroundStyle(Constants.titleColor)
                
            Spacer()
                
            LiquidGlassButton(systemImage: Constants.buttonSystemImage, buttonSize: Constants.buttonSize, action: action)
        }
        .padding([.leading, .trailing], Constants.horizontalPadding)
    }
}

