//
//  MainView.swift
//  TCANavigation
//
//  Created by Anton Gorlov on 07.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct MainView: View {
    
    @Bindable var store: StoreOf<MainReducer>
    var players: [PlayerModel]
    
    var body: some View {
            
        VStack(alignment: .leading, spacing: 16) {
            
            ForEach(players) { cell in
                
                HStack {
                    
                    Text(cell.name)
                    
                    Text(cell.surname)
                    
                }
                .onTapGesture {
                    
                    store.send(.selectedPlayerAction(cell))
                }
                .font(.title2)
                .foregroundStyle(.indigo .opacity(0.7))
                
                Divider()
            }
        }
        .padding(16)
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.purple, .green, .yellow]).opacity(0.5))
        .fullScreenCover(item: $store.scope(state: \.currentPlayer
                                            , action: \.childPlayerAction)) { store in
            
            PlayerView(store: store)
        }
        
    }
        
}

#Preview {
    
    let player1 = PlayerModel(id: UUID(),
                              name: "Francesco",
                              surname: "Totti",
                              age: 47,
                              number: 10,
                              position: .forward)
    
    let player2 = PlayerModel(id: UUID(),
                              name: "Fernando",
                              surname: "Torres",
                              age: 40,
                              number: 9,
                              position: .forward)
    
    let player3 = PlayerModel(id: UUID(),
                              name: "Toni",
                              surname: "Croos",
                              age: 25,
                              number: 8,
                              position: .midfield)
    
    let player4 = PlayerModel(id: UUID(),
                              name: "Marcos",
                              surname: "Cafu",
                              age: 54,
                              number: 2,
                              position: .defender)
    
    let player5 = PlayerModel(id: UUID(),
                              name: "Gianluigi",
                              surname: "Buffon",
                              age: 46,
                              number: 1,
                              position: .golkeeper)
    
    let players = [player1, player2, player3, player4, player5]
    
    let store = Store(initialState: MainReducer.State()) {
        MainReducer()
    }
    
    return MainView(store: store, players: players)
}
