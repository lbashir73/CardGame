//
//  ContentView.swift
//  warGame
//
//  Created by Lisa on 7/24/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "card5"
    @State var cpuCard = "card10"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {

        
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .opacity(/*@START_MENU_TOKEN@*/0.5/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack {
                    Image(playerCard).padding()
                    Image(cpuCard).padding()
                }
                Spacer()
                
                Button(action: {
                    
                    // get random numbers
                    let playerRandom = Int.random( in: 2...14 )
                    let cpuRandom = Int.random( in: 2...14 )
                    
                    // update cards
                    playerCard = "card" + String(playerRandom)
                    cpuCard = "card" + String(cpuRandom)
                    
                    // update scores
                    if ( playerRandom > cpuRandom ) {
                        playerScore += 1
                    }
                    else if ( cpuRandom > playerRandom ) {
                        cpuScore += 1
                    }
                    else {
                        playerScore += 1
                        cpuScore += 1
                    }
                }, label: {
                    Image("dealbutton")
                })
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("Player")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        Text( String(playerScore) )
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }.padding()
                    VStack {
                        Text("CPU")
                            .font(.title)
                            .foregroundColor(.white)
                            .padding(.bottom)
                        Text( String(cpuScore) )
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }.padding()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
