//
//  CreateSelectorView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 21.10.2025.
//

import SwiftUI

struct CreateSelectorView: View {
    @StateObject private var viewModel: HomeNavigationState = DIContainer.shared.resolve(HomeNavigationState.self)
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Create Selector")
                    .font(.title)
                
                Button("Close") {
                    dismiss()
                }
            }
        }
        
    }
}
