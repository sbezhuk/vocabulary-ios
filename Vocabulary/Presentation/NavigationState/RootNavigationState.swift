//
//  RootNavigationState.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import Combine
import Foundation
import SwiftUI

final class RootNavigationState: ObservableObject {
    @Published var navigationPath = NavigationPath()
    
    @Published var appRootScreen: AppScreen = .onboarding
    @Published var appRootSheet: AppSheet?
    
    init() {
        let hasSeenOnboarding = UserDefaults.standard.bool(forKey: RootNavigationStateConstants.hasSeenOnboardingKey)
        appRootScreen = hasSeenOnboarding ? .main : .onboarding
    }
    
    public func completeOnboardingView() {
        UserDefaults.standard.set(true, forKey: RootNavigationStateConstants.hasSeenOnboardingKey)
        setRootScreen(.main)
    }
    
    public func openCreateSelectorSheet() {
        presentSheet(.createSelector)
    }
}

// MARK: - Navigation Methods

private extension RootNavigationState {
    func navigate(to screen: AppScreen) {
        navigationPath.append(screen)
    }
    
    func navigateBack() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }
    
    func navigateToRoot() {
        navigationPath = NavigationPath()
    }
    
    func setRootScreen(_ screen: AppScreen) {
        navigationPath = NavigationPath()
        appRootScreen = screen
    }
}

// MARK: - Sheet Navigation Methods

private extension RootNavigationState {
    func presentSheet(_ sheet: AppSheet) {
        appRootSheet = sheet
    }
        
    func dismissSheet() {
        appRootSheet = nil
    }
}
