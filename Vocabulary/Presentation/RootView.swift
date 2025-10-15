//
//  RootView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import SwiftUI

struct RootView: View {
    @StateObject private var viewModel: RootViewModel = DIContainer.shared.resolve(RootViewModel.self)
    
    var body: some View {
        switch viewModel.currentScreen {
        case .onboarding:
            OnboardingView()
        case .main:
            MainView()
        }
    }
}
