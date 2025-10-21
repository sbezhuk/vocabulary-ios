//
//  AppScreen.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

enum AppScreen: Identifiable {
    case onboarding
    case main
    
    var id: String {
        switch self {
        case .onboarding: return "onboarding"
        case .main: return "main"
        }
    }
}
