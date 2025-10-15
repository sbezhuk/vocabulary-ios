//
//  Font+Extensions.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 28.09.2025.
//

import SwiftUI

extension Font {
    static func isCustomFontAvailable(_ fontName: String) -> Bool {
        return UIFont(name: fontName, size: 12) != nil
    }
    
    static func availableFontFamilies() -> [String] {
        return UIFont.familyNames.sorted()
    }
    
    static func fontsInFamily(_ familyName: String) -> [String] {
        return UIFont.fontNames(forFamilyName: familyName)
    }
}

extension Font {
    enum GeologicaFont: String, CaseIterable {
        case black = "Geologica-Black"
        case bold = "Geologica-Bold"
        case light = "Geologica-Light"
        case medium = "Geologica-Medium"
        case regular = "Geologica-Regular"
        
        var name: String {
            return self.rawValue
        }
    }
    
    static func geologica(_ font: GeologicaFont, size: CGFloat) -> Font {
        return .custom(font.name, size: size)
    }
}
