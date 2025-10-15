//
//  AppRouter.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import SwiftUI
import Combine

final class AppRouter: ObservableObject {
    @Published var currentScreen: AppScreen = .onboarding
    
    func navigate(to screen: AppScreen) {
        withAnimation {
            currentScreen = screen
        }
    }
}
