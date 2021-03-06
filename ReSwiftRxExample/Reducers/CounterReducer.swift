//
//  CounterReducer.swift
//  ReSwiftRxExample
//
//  Created by Tomohiro Takezawa on 2016/10/16.
//  Copyright © 2016年 Tomohiro Takezawa. All rights reserved.
//

import ReSwift

struct CounterReducer: Reducer {

    func handleAction(action: Action, state: AppState?) -> AppState {
        var state = state ?? AppState()

        switch action {
        case _ as CounterActionIncrease:
            state.counter += 1
        case _ as CounterActionDecrease:
            state.counter -= 1
        default:
            break
        }

        return state
    }

}
