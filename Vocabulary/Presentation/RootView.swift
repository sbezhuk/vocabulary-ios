//
//  RootView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject private var viewModel: RootViewModel
    
    var body: some View {
        screenView(for: viewModel.currentScreen)
            .id(viewModel.currentScreen)
            
    }
    
    @ViewBuilder
    private func screenView(for screen: AppScreen) -> some View {
        switch screen {
        case .onboarding:
            OnboardingView()
        case .main:
            MainView()
        }
    }
}
