//
//  MainView.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house", value: 0) {
                Color.green.ignoresSafeArea()
            }
            
            Tab("Profile", systemImage: "person", value: 1) {
                Color.blue.ignoresSafeArea()
            }
            
            Tab("Settings", systemImage: "gearshape", value: 2) {
                Color.red.ignoresSafeArea()
            }
        }
    }
}
