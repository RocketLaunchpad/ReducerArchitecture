//
//  File.swift
//  
//
//  Created by Ilya Belenkiy on 8/28/21.
//

#if canImport(SwiftUI)
import SwiftUI

public extension StateStore {
    public func binding<Value>(_ keyPath: KeyPath<State, Value>, _ action: @escaping (Value) -> MutatingAction) -> Binding<Value> {
        return Binding(get: { self.state[keyPath: keyPath] }, set: { self.send(.mutating(action($0))) })
    }

    public func readOnlyBinding<Value>(_ keyPath: KeyPath<State, Value>) -> Binding<Value> {
        return Binding(
            get: { self.state[keyPath: keyPath] },
            set: { _ in
                assertionFailure()
                self.send(.noAction)
            }
        )
    }
}

public protocol StoreContentView: View {
    associatedtype StoreWrapper: StoreNamespace
    typealias Store = StoreWrapper.Store
    var store: Store { get }
    init(store: Store)
}

public protocol StoreUIWrapper {
    associatedtype ContentView: StoreContentView where ContentView.StoreWrapper == Self
}

public struct StoreUI<UIWrapper: StoreUIWrapper> {
    public let store: UIWrapper.Store

    public init(_ store: UIWrapper.Store) {
        self.store = store
    }

    public func makeView() -> UIWrapper.ContentView {
        UIWrapper.ContentView(store: store)
    }
    public var value: UIWrapper.Store.ValuePublisher { store.value }
}

#endif
