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
                HomeView()
            }
            
            Tab("Profile", systemImage: "person", value: 1) {
                ProfileView()
            }
            
            Tab("Settings", systemImage: "gearshape", value: 2) {
                SettingsView()
            }
        }
    }
}
