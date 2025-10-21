//
//  RootView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var rootViewModel: RootNavigationState = DIContainer.shared.resolve(RootNavigationState.self)
    
    var body: some View {
        NavigationStack(path: $rootViewModel.navigationPath) {
            currentScreen.navigationDestination(for: AppScreen.self) { screen in
                screenView(for: screen)
            }
        }
    }
    
    @ViewBuilder
    private var currentScreen: some View {
        screenView(for: rootViewModel.appRootScreen)
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
