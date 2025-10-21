//
//  HomeView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 16.10.2025.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var viewModel: RootViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: .background).ignoresSafeArea()
            
            HeaderView() {
                viewModel.openCreateSelectorSheet()
            }.frame(maxWidth: .infinity, alignment: .top)
        }
    }
}
