//
//  DIContainer.swift
//  Vocabulary
//
//  Created by Stepan Bezhuk on 15.10.2025.
//

import Swinject

final class DIContainer {
    static let shared = DIContainer()
    
    let container = Container()
    
    private init() {
        registerViewModels()
    }
    
    private func registerViewModels() {
        container.register(RootNavigationState.self) { _ in
            RootNavigationState()
        }.inObjectScope(.container)
        
        container.register(HomeNavigationState.self) { _ in
            HomeNavigationState()
        }.inObjectScope(.container)
    }
}

extension DIContainer {
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
