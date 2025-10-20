//
//  View+Extensions.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 20.10.2025.
//

import SwiftUI

extension View {
    func hideBackButton() -> some View {
        self
            .navigationBarBackButtonHidden(true)
            .toolbar(.hidden, for: .navigationBar)
    }
}
