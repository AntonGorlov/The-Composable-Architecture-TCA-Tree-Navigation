//
//  PlayerReducer.swift
//  TCANavigation
//
//  Created by Anton Gorlov on 07.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct PlayerReducer {
    
    @Dependency(\.dismiss) var dismissPlayerScreen // Second version of close the modal screen
    
    @ObservableState
    struct State {
        var playerModel: PlayerModel
    }
    
    enum Action {
        case closeAction
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .closeAction:
               
                return .run { _ in // run because  dismiss() it's an async func
                    await dismissPlayerScreen()
                }
            }
        }
    }
}
