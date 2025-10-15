//
//  RootViewModel.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import Combine
import Foundation

private enum Constants {
    static let hasSeenOnboardingKey = "hasSeenOnboarding"
}

final class RootViewModel: ObservableObject {
    @Published var currentScreen: AppScreen = .onboarding
    
    private var cancellables = Set<AnyCancellable>()
    
    private let appRouter: AppRouter
    
    init(appRouter: AppRouter) {
        self.appRouter = appRouter
        
        let hasSeenOnboarding = UserDefaults.standard.bool(
            forKey: Constants.hasSeenOnboardingKey
        )
        currentScreen = hasSeenOnboarding ? .main : .onboarding
        
        $currentScreen.sink { [weak self] screen in
            self?.appRouter.navigate(to: screen)
        }.store(in: &cancellables)
    }
    
    func completeOnboardingView() {
        UserDefaults.standard.set(true, forKey: Constants.hasSeenOnboardingKey)
        currentScreen = .main
    }
}
