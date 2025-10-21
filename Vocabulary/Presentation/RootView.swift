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
        NavigationStack(path: $viewModel.navigationPath) {
            currentScreen.navigationDestination(for: AppScreen.self) { screen in
                screenView(for: screen)
            }
        }
    }
    
    @ViewBuilder
    private var currentScreen: some View {
        screenView(for: viewModel.appRootScreen)
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
