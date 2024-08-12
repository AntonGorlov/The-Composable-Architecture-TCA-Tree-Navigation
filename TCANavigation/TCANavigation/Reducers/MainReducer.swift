//
//  MainReducer.swift
//  TCANavigation
//
//  Created by Anton Gorlov on 07.08.2024.
//

import Foundation
import ComposableArchitecture

@Reducer
struct MainReducer {
    
    @ObservableState
    struct State {
        
        @Presents
        var currentPlayer: PlayerReducer.State?
    }
    
    enum Action {
        case selectedPlayerAction(PlayerModel)
        case childPlayerAction(PresentationAction<PlayerReducer.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            case .selectedPlayerAction(let playerModel):
                state.currentPlayer = PlayerReducer.State(playerModel: playerModel)
                return .none
//            case .childPlayerAction(.presented(.closeAction)): // First version of close the modal screen
//                state.currentPlayer = nil
//                return .none
            default:
                return .none
            }
        
        }
        //We need to tell our reducer if state var currentPlayer: PlayerReducer.State? will be active (cell pressed), then redirect the corresponding actions and the corresponding reducer. The child reducer receives events first, then the parent
        .ifLet(\.$currentPlayer, action: \.childPlayerAction) {
            PlayerReducer()
        }
    }
}
