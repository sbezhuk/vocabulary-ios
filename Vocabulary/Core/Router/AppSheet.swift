//
//  AppSheet.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 21.10.2025.
//

enum AppSheet: Identifiable {
    case createSelector
    
    var id: String {
        switch self {
        case .createSelector: return "createSelector"
        }
    }
}
