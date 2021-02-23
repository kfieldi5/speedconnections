//
//  RoundView.swift
//  speedconnections
//
//  Created by kfielding on 2/22/21.
//

import SwiftUI

struct RoundView: View {
    var deck: Deck
//    var names: [String]
    @State var i:Int = 0
    @State var timeRemaining = 120
    @State var timerString: String = "2:00"
    @State var timerColor:Color = .black
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isPaused = false;
    
    var body: some View {
        VStack {
    //        Text("\(names[0])'s turn to answer")
    //            .font(.title3)
            Spacer()
                .opacity(0)
            Text(deck.questions[i])
                .padding()
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Spacer()
                .opacity(0)
            Text("\(timerString)")
                .id("timerText")
                .padding()
                .font(.title)
                .foregroundColor(self.timeRemaining <= 10 ? Color.red : Color.black)
            HStack (spacing: 30) {
                Button(action: {
                    timeRemaining = 120
                    timerString = "2:00"
                    i -= 1
                    if i < 0 {
                        i = deck.questions.count - 1
                    }
                }) {
                    Image(systemName: "arrowshape.turn.up.left.fill")
                        .resizable()
                        .padding(14)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
                Button(action: {
                    isPaused = !isPaused
                }) {
                    Image(systemName: isPaused ? "play.fill" : "pause.fill")
                        .resizable()
                        .padding(14)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                        .disabled(self.timeRemaining <= 10 ? true : false)
                }
                Button(action: {
                    timeRemaining = 120
                    timerString = "2:00"
                    i += 1
                    if (i > deck.questions.count - 1) {
                        i = 0
                    }
                }) {
                    Image(systemName: "arrowshape.turn.up.right.fill")
                        .resizable()
                        .padding(14)
                        .frame(width: 50, height: 50)
                        .background(Color.blue)
                        .clipShape(Circle())
                        .foregroundColor(.white)
                }
            }
            
        }
        .padding()
        .navigationBarTitle(Text(deck.name))
        .onReceive(timer) { _ in
            if self.timeRemaining > 0 && !isPaused {
                self.timeRemaining -= 1
                let (m, s) = secondsToMinutesSeconds(seconds: self.timeRemaining)
                self.timerString = String(format: "%01d:%02d", m, s)
            }
        }
        .background(
            Image(systemName: deck.icon)
                .resizable()
                .frame(width: 460, height: 460, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .offset(x: 0, y: -60)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.black)
                .opacity(0.03)
        )
    }
}

func secondsToMinutesSeconds (seconds : Int) -> (Int, Int) {
  return ((seconds % 3600) / 60, (seconds % 3600) % 60)
}

struct RoundView_Previews: PreviewProvider {
    static var previews: some View {
        RoundView(deck: decks[0])
    }
}
