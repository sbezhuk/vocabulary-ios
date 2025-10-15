//
//  VocabularyApp.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import SwiftUI

@main
struct VocabularyApp: App {
    @StateObject private var rootViewModel: RootViewModel = DIContainer.shared.resolve(RootViewModel.self)
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environmentObject(rootViewModel)
        }
    }
}
