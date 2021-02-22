//
//  ContentView.swift
//  speedconnections
//
//  Created by kfielding on 2/22/21.
//

import SwiftUI

struct LobbyView: View {
    @State private var p1:String = ""
    @State private var p2:String = ""
    var body: some View {
        NavigationView {
            VStack(spacing: 18) {
                Text("Speed Connections")
                    .padding()
                    .font(.title)
                TextField("Player 1 Name", text:$p1)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                TextField("Player 2 Name", text:$p2)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                Button(action: {
                    
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .padding(6)
                        .frame(width: 24, height: 24)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                NavigationLink(destination: DeckBrowserView()) {
                    Text("Start Session")
                        .fontWeight(.bold)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(10)
                        .cornerRadius(40)
                }
                .navigationBarTitle(Text("Lobby"))
                .navigationBarHidden(true)
            }
            .padding(.horizontal)
        }
    }
}

struct LobbyView_Previews: PreviewProvider {
    
    static var previews: some View {
        LobbyView()
    }
}
