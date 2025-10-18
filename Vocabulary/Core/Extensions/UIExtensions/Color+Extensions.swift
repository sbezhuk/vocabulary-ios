//
//  Color+Extensions.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

public enum AppColor: String, CaseIterable {
    case background = "#20202D"
    case lightWhite = "#EDEDED"
}

extension Color {
    public init(hex: AppColor) {
        let cleaned = hex.rawValue
            .trimmingCharacters(in: .whitespacesAndNewlines)
            .uppercased()
            .replacingOccurrences(of: "#", with: "")

        guard cleaned.count == 6, let value = UInt64(cleaned, radix: 16) else {
            self.init(red: 0, green: 0, blue: 0)
            return
        }

        let r = Double((value >> 16) & 0xFF) / 255.0
        let g = Double((value >> 8) & 0xFF) / 255.0
        let b = Double(value & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}
