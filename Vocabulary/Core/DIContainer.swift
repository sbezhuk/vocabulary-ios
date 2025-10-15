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
        registerServices()
        registerViewModels()
    }
    
    private func registerServices() {
        container.register(AppRouter.self) { _ in
            AppRouter()
        }
    }
    
    private func registerViewModels() {
        container.register(RootViewModel.self) { resolver in
            let router = resolver.resolve(AppRouter.self)!
            return RootViewModel(appRouter: router)
        }
    }
}

extension DIContainer {
    func resolve<T>(_ type: T.Type) -> T {
        container.resolve(T.self)!
    }
}
