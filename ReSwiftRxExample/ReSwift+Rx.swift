//
//  ReSwift+Rx.swift
//  ReSwiftRxExample
//
//  Created by Tomohiro Takezawa on 2016/10/23.
//  Copyright © 2016年 Tomohiro Takezawa. All rights reserved.
//

import Foundation

import ReSwift
import RxSwift

public class RxStore<State: StateType> {
    internal let subject = PublishSubject<State>()
    private let store: Store<State>

    init(store: Store<State>) {
        self.store = store
        self.store.subscribe(self)
    }

    deinit {
        self.store.unsubscribe(self)
    }

    lazy var dispatcher: AnyObserver<State> = { [unowned self] in
        return self.subject.asObserver()
    }()
}

extension RxStore: StoreSubscriber {
    public func newState(state: State) {
        subject.onNext(state)
    }
}

extension RxStore: ObservableType {
    public typealias E = State
    public func subscribe<O: ObserverType>(_ observer: O) -> Disposable where O.E == E {
        return subject.subscribe(observer)
    }
}
