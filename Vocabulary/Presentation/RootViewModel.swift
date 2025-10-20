//
//  RootViewModel.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import Combine
import Foundation
import SwiftUI

private enum Constants {
    static let hasSeenOnboardingKey = "hasSeenOnboarding"
}

final class RootViewModel: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var rootScreen: AppScreen = .onboarding
    
    private var cancellables = Set<AnyCancellable>()
    
    private let appRouter: AppRouter
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter

#if DEBUG
        UserDefaults.standard.set(false, forKey: Constants.hasSeenOnboardingKey)
#endif
        
        let hasSeenOnboarding = UserDefaults.standard.bool(
            forKey: Constants.hasSeenOnboardingKey
        )
        
        rootScreen = hasSeenOnboarding ? .main : .onboarding
        
        $navigationPath.sink { path in
            print("Navigation path changed: \(path.count) screens")
        }.store(in: &cancellables)
    }
    
    func completeOnboardingView() {
        UserDefaults.standard.set(true, forKey: Constants.hasSeenOnboardingKey)
        self.navigate(to: .main)
    }
}

// MARK: - Navigation Methods

private extension RootViewModel {
    func navigate(to screen: AppScreen) {
        navigationPath.append(screen)
        appRouter.navigate(to: screen)
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
        rootScreen = screen
        appRouter.navigate(to: screen)
    }
}
