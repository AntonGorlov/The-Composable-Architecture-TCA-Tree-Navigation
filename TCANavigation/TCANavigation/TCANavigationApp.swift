//
//  TCANavigationApp.swift
//  TCANavigation
//
//  Created by Anton Gorlov on 07.08.2024.
//

import SwiftUI
import ComposableArchitecture


// TCA the tree navigation

@main
struct TCANavigationApp: App {
    var body: some Scene {
        
        WindowGroup {
            
            let player1 = PlayerModel(id: UUID(),
                                      name: "Edwin",
                                      surname: "Van Der Sar",
                                      age: 53,
                                      number: 1,
                                      position: .golkeeper)
            
            let player2 = PlayerModel(id: UUID(),
                                      name: "Roberto",
                                      surname: "Carlos",
                                      age: 51,
                                      number: 3,
                                      position: .defender)
            
            let player3 = PlayerModel(id: UUID(),
                                      name: "Clarence",
                                      surname: "Seedorf",
                                      age: 48,
                                      number: 20,
                                      position: .midfield)
            
            let player4 = PlayerModel(id: UUID(),
                                      name: "Edson Arantis",
                                      surname: "Pele",
                                      age: 82,
                                      number: 10,
                                      position: .forward)
            
            let players = [player1, player2, player3, player4]
            
            let store = Store(initialState: MainReducer.State()) {
                MainReducer()
            }
            
            MainView(store: store, players: players)
        }
    }
}
