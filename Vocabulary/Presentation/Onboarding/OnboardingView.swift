//
//  OnboardingView.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 18.09.2025.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var viewModel: RootViewModel
    
    var body: some View {
        ZStack {
            RiveBackgroundView()
            
            VStack {
                Spacer().frame(height: 74)
                
                AnimatedTextSection()
                
                Spacer()
                
                TermsText()
            }
            .padding(.horizontal, 24)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    LiquidGlassButton {
                        viewModel.completeOnboardingView()
                    }
                }
                .padding(.trailing, 24)
                .padding(.bottom, 60)
            }
        }
    }
}

// MARK: - Animated text section
private struct AnimatedTextSection: View {
    var body: some View {
        AnimatedTextView(
            title: "Expand Your Vocabulary",
            subtitle: "Learn, remember, and use English words effortlessly.",
            titleStyle: AnimatedTextStyle(
                fontSize: 36,
                fontWeight: .black,
                color: .white
            ),
            subtitleStyle: AnimatedTextStyle(
                fontSize: 18,
                fontWeight: .medium,
                color: .white
            )
        )
    }
}

// MARK: - Terms text
private struct TermsText: View {
    var body: some View {
        Text("Please take a moment to read our Terms and Conditions before use")
            .font(.geologica(.light, size: 14))
            .foregroundColor(.white.opacity(0.8))
            .multilineTextAlignment(.center)
    }
}
