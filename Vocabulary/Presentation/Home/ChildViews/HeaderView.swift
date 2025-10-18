//
//  HeaderView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 18.10.2025.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Text("Home")
                .font(Font.geologica(.bold, size: 32))
                .foregroundStyle(Color(hex: .lightWhite))
                
            Spacer()
                
            LiquidGlassButton(systemImage: "plus", buttonSize: 60) {
                print("add ++++")
            }
        }
        .padding([.leading, .trailing], 24)
    }
}

