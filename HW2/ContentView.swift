// PROGRAMMER: Alexander Suarez
// PANTHER ID: 5740360
//
// CLASS: COP4655
// SECTION: RVC
// SEMESTER: The current semester: Fall 2024
//
// CERTIFICATION: I certify that this work is my own and that
// none of it is the work of any other person.
//=============================================================================

import SwiftUI

struct ContentView: View {
    
    @State var first = 0
    @State var second = 0
    @State var third = 0 // Digits of game number generator
    @State var gameNumber = 0
    @State var ladybugScore = 0
    @State var antScore = 0
    @State var ladybugNumber = 0
    @State var antNumber = 0
    @State var gamesPlayed = 0
    var body: some View {
        
        VStack {
            
            Spacer()     //Very top spacer
            
            HStack{     //Open player HStack
                
                Spacer()
                //------------LADYBUG STACK--------------------
                VStack{
                    Text("RandomNumber")
                        .frame(width: 140, height: 50, alignment:.center)
                    
                    Text("\(ladybugNumber)")
                    
                    Image(systemName: "ladybug")
                        .padding(.all)
                        .scaleEffect(3.0)
                    
                    Text("\(ladybugScore)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: 100, alignment: .center)
                        
                }
                
                Spacer()
                
                //------------ANT STACK----------------------
                VStack{
                    
                    Text("RandomNumber")
                    
                        .frame(width: 140, height: 50, alignment:.center)
                    
                    Text("\(antNumber)")
                    
                    Image(systemName: "ant")
                        .padding(.all)
                        .scaleEffect(3.0)
                    
                    Text("\(antScore)")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    
                }
                
                Spacer()
                
            }           //Close player HStack
            
            //---------------PLAY BUTTON----------------------
            HStack{
                Button(
                    action:{
                        gamesPlayed += 1
                        
                        //Generating game number
                        first = Int.random(in:0...9)
                        second = Int.random(in:0...9)
                        third = Int.random(in:0...9)
                        gameNumber = first * 100 + second * 10 + third
                        
                        //Generating player numbers
                        ladybugNumber = Int.random(in: 0...999)
                        antNumber = Int.random(in: 0...999)
                        
                        //Scoring the players
                        if ladybugNumber > gameNumber {
                            ladybugScore += 1
                        }
                        
                        if antNumber > gameNumber {
                            antScore += 1
                        }
                        
                }) {
                    Image("PlayButton")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:120)
                }
            }
            //----------GAME DIGITS IMAGES----------------
            Text("Game Random: \(gameNumber)")
            
            HStack{     //Numbers Image
                Image("\(first)")
                Image("\(second)")
                Image("\(third)")
            }
            //--------------------------------------
            Spacer()
            
            Text("Number of times played: \(gamesPlayed)")
        }
    }//End body
}

#Preview {
    ContentView()
}
