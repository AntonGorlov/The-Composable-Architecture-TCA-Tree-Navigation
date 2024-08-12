//
//  PlayerView.swift
//  TCANavigation
//
//  Created by Anton Gorlov on 07.08.2024.
//

import SwiftUI
import ComposableArchitecture

struct PlayerView: View {
    
    var store: StoreOf<PlayerReducer>
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            
            Button(action: {
                store.send(.closeAction)
            }, label: {
                Image(systemName: "xmark.square.fill")
                    .font(.system(size: 40))
                
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            
            Text("Name: \(store.playerModel.name)")
            
            Text("Surname: \(store.playerModel.surname)")
            
            Text("Age: \(store.playerModel.age)")
            
            Text("Position: \(store.playerModel.position.description())")
            
            Text("Number: \(store.playerModel.number)")
        }
        .font(.title2)
        .foregroundStyle(.indigo .opacity(0.7))
        .padding(16)
        .containerRelativeFrame([.horizontal, .vertical])
        .background(Gradient(colors: [.purple, .green, .yellow]).opacity(0.5))
    }
}

#Preview {
    
    let player = PlayerModel(id: UUID(),
                             name: "Ronaldo de Assis Moreira,",
                             surname: "Ronaldinho",
                             age: 44,
                             number: 10,
                             position: .midfield)
    
    let store = Store(initialState: PlayerReducer.State(playerModel: player)) {
        
        PlayerReducer()
    }
    
    return PlayerView(store: store)
}
