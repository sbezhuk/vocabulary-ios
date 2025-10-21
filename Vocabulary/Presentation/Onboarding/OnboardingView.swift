//
//  OnboardingView.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 18.09.2025.
//

import SwiftUI

private enum Constants {
    static let topFrameHeight: CGFloat = 74
    
    static let headerHorizontalPadding: CGFloat = 24
    
    static let bottomNextButtonTrailngPadding: CGFloat = 24
    static let bottomNextButtonBottomPadding: CGFloat = 60
    
}

struct OnboardingView: View {
    @StateObject private var rootViewModel: RootNavigationState = DIContainer.shared.resolve(RootNavigationState.self)
    
    var body: some View {
        ZStack {
            RiveBackgroundView()
            
            VStack {
                Spacer().frame(height: Constants.topFrameHeight)
                AnimatedTextSectionView()
                Spacer()
                TermsTextView()
            }
            .padding(.horizontal, Constants.headerHorizontalPadding)
        }
        .overlay(
            HStack {
                Spacer()
                LiquidGlassButton {
                    rootViewModel.completeOnboardingView()
                }
            }.padding(.trailing, Constants.bottomNextButtonTrailngPadding).padding(
                .bottom,
                Constants.bottomNextButtonBottomPadding
            ),
            alignment: .bottomTrailing
        )
    }
}
