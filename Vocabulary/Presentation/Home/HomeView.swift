//
//  HomeView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 16.10.2025.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = DIContainer.shared.resolve(HomeNavigationState.self)
    
    var body: some View {
        NavigationStack(path: $viewModel.navigationPath) {
            content.navigationDestination(for: HomeScreen.self) { screen in
                screenView(for: screen)
            }
        }
        .sheet(item: $viewModel.presentedSheet) { sheet in
            sheetView(for: sheet)
        }
    }
    
    private var content: some View {
        ZStack(alignment: .top) {
            Color(hex: .background).ignoresSafeArea()
            
            HeaderView() {
                viewModel.openCreateSelectorSheet()
            }.frame(maxWidth: .infinity, alignment: .top)
        }
    }
    
    @ViewBuilder
    private func screenView(for screen: HomeScreen) -> some View {
        switch screen {
        default:
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func sheetView(for sheet: HomeSheet) -> some View {
        switch sheet {
        case .createSelector:
            CreateSelectorView()
        }
    }
}
