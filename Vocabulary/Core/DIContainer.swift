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
        container.register(RootViewModel.self) { _ in RootViewModel() }
    }
}

extension DIContainer {
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
