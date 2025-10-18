//
//  AnimatedTextSection.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

struct AnimatedTextSectionView: View {
    var body: some View {
        AnimatedTextView(
            title: "Expand Your Vocabulary",
            subtitle: "Learn, remember, and use English words effortlessly.",
            titleStyle: AnimatedTextStyle(
                fontSize: 36,
                fontWeight: .black,
                color: Color(hex: .lightWhite)
            ),
            subtitleStyle: AnimatedTextStyle(
                fontSize: 18,
                fontWeight: .medium,
                color: Color(hex: .lightWhite)
            )
        )
    }
}
