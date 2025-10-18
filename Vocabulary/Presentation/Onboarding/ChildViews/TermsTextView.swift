//
//  TermsText.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

struct TermsTextView: View {
    var body: some View {
        Text("Please take a moment to read our Terms and Conditions before use")
            .font(Font.geologica(.light, size: 14))
            .foregroundColor(Color(hex: .lightWhite))
            .multilineTextAlignment(.center)
    }
}

