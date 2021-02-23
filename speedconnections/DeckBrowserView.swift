//
//  DeckBrowserView.swift
//  speedconnections
//
//  Created by kfielding on 2/22/21.
//

import SwiftUI

struct DeckBrowserView: View {
    var body: some View {
        NavigationView {
            List(decks, id: \.id) { deck in
                DeckBrowserTile(deck: deck)
            }
        }
        .navigationBarTitle(Text("Decks"))
    }
}

struct DeckBrowserView_Previews: PreviewProvider {
    static var previews: some View {
        DeckBrowserView()
    }
}

struct DeckBrowserTile: View {
    var deck: Deck
    var body: some View {
        HStack {
            Image(systemName: "x.circle")
                .resizable()
                .frame(width:50, height:50)
            Text(deck.name)
            Spacer()
        }
    }
}
