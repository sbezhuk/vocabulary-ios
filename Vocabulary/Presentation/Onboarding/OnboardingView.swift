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
                
                AnimatedTextSectionView()
                
                Spacer()
                
                TermsTextView()
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
