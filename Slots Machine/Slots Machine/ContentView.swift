//
//  ContentView.swift
//  Slots Machine
//
//  Created by Taha on 7/10/20.
//  Copyright © 2020 Taha. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationView {
             
            ZStack {
                
                // Background
                Rectangle()
                    .foregroundColor(Color(red: 66/255, green: 93/255, blue: 200/255))
                    .edgesIgnoringSafeArea(.all)
                
                Rectangle()
                    .foregroundColor(Color(red: 66/255, green: 221/255, blue: 255/255))
                    .rotationEffect(Angle(degrees: 45))
                    .edgesIgnoringSafeArea(.all)
                    
                
                VStack {
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                        Text("Slot Machine")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .foregroundColor(Color.white)
                        Image(systemName: "star.fill")
                            .foregroundColor(.yellow)
                    }
                    .font(.title)
                    .shadow(radius: 4)
                    
                    Spacer()
                    
                    HStack {
                        Image("apple")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                        Image("cherry")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                        Image("star")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(20)
                    }
                    .shadow(radius: 1)
                    
                    Spacer()
                    
                    NavigationLink(destination: GameView()) {
                        Text("Play Game")
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(.horizontal, 30)
                            .padding(.vertical, 10)
                            .background(Color.blue)
                            .cornerRadius(20)
                        
                    }
                    .padding(.bottom, 50)
                    .shadow(radius: 4)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
