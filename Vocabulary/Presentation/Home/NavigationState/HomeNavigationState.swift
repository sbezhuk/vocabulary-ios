//
//  HomeNavigationState.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 21.10.2025.
//

import Combine
import Foundation
import SwiftUI

final class HomeNavigationState: ObservableObject {
    @Published var navigationPath = NavigationPath()
    @Published var presentedSheet: HomeSheet?
    
    // MARK: - Public Methods
    
    func openCreateSelectorSheet() {
        presentSheet(.createSelector)
        
    }
    
    func dismissSheet() {
        presentedSheet = nil
    }
}

// MARK: - Navigation Methods

private extension HomeNavigationState {
    func navigate(to screen: HomeScreen) {
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
}

// MARK: - Sheet Methods

private extension HomeNavigationState {
    func presentSheet(_ sheet: HomeSheet) {
        presentedSheet = sheet
    }
}
