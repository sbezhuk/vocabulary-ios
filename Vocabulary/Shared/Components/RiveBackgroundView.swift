//
//  RiveBackgroundView.swift
//  ShamirVault
//
//  Created by Stepan Bezhuk on 28.09.2025.
//

import SwiftUI
import RiveRuntime

// MARK: Constants
private enum Constants {
    static let riveFileName = "shapes"
    static let splineImageName = "Spline"
    static let riveBlurRadius: CGFloat = 30
    static let backgroundBlurRadius: CGFloat = 50
    static let backgroundOffset = CGSize(width: 200, height: 100)
}

// MARK: - RiveBackgroundView
struct RiveBackgroundView: View {
    
    // MARK: Properties
    @StateObject private var riveModel = RiveViewModel(
        fileName: Constants.riveFileName
    )
    
    // MARK: Body
    var body: some View {
        riveLayer()
            .background {
                backgroundLayer()
            }
            .ignoresSafeArea()
    }
    
    // MARK: - Private Methods
    private func riveLayer() -> some View {
        riveModel.view()
            .blur(radius: Constants.riveBlurRadius)
    }

    private func backgroundLayer() -> some View {
        ZStack {
            Color.black

            Image(Constants.splineImageName)
                .blur(radius: Constants.backgroundBlurRadius)
                .offset(Constants.backgroundOffset)
        }
    }
}

// MARK: - Preview
#Preview {
    RiveBackgroundView()
}
