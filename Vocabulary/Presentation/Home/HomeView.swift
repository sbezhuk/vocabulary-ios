//
//  HomeView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 16.10.2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: .background).ignoresSafeArea()
            
            HeaderView() {
                
            }.frame(maxWidth: .infinity, alignment: .top)
        }
    }
}
