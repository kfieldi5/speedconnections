//
//  DeckBrowserView.swift
//  speedconnections
//
//  Created by kfielding on 2/22/21.
//

import SwiftUI

struct DeckBrowserView: View {
    @State private var previewIndex = 2
    var timerOptions = ["30 seconds", "1 minute", "2 minutes", "5 minutes"]
    
    init() {
//        let coloredAppearance = UINavigationBarAppearance()
//        coloredAppearance.configureWithTransparentBackground()
//
//        UINavigationBar.appearance().standardAppearance = coloredAppearance
//        UINavigationBar.appearance().compactAppearance = coloredAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    var body: some View {
        VStack {
            List(decks, id: \.id) { deck in
                NavigationLink(destination: RoundView(deck: deck)) {
                    DeckBrowserTile(deck: deck)
                        .padding()
                }
            }
//            Form {
//                Section(header: Text("SETTINGS")) {
//                    Picker(selection:$previewIndex, label: Text("Question Timer")) {
//                        ForEach(0 ..< timerOptions.count) {
//                            Text(self.timerOptions[$0])
//                        }
//                    }
//                }
//            }
        }
        .navigationBarTitle("Decks", displayMode: .automatic)
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
            Image(systemName: deck.icon)
                .resizable()
                .frame(width:35, height:35)
                .padding()
            Text(deck.name)
            Spacer()
        }
    }
}
