//
//  GameView.swift
//  Slots Machine
//
//  Created by Taha on 7/13/20.
//  Copyright © 2020 Taha. All rights reserved.
//

import SwiftUI

struct GameView: View {
    @State private var credits = 1000.0
    @State private var slotImages = ["apple", "cherry", "star"]
    @State private var slotImageBackgrounds = Array(repeating: Color.white, count: 9)
    @State private var numbers = Array(repeating: 0, count: 9)
    private let betAmount = 100.0
    
    var body: some View {
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
                
                // Credits Counter
                Text("Credits: " + String(Int(credits)))
                    .padding(.all, 10)
                    .background(Color(red: 221/255, green: 221/255, blue: 221/255))
                    .cornerRadius(20)
                
                Spacer()
                
                // Images Grid
                VStack {
                    
                    // Row 1
                    HStack {
                        
                        CardView(image: $slotImages[numbers[0]], imageBackground: $slotImageBackgrounds[0])
                                                
                        CardView(image: $slotImages[numbers[1]], imageBackground: $slotImageBackgrounds[1])
                        
                        CardView(image: $slotImages[numbers[2]], imageBackground: $slotImageBackgrounds[2])
                        
                    }.padding(.horizontal, 10)
                    
                    // Row 2
                    HStack {
                        
                        CardView(image: $slotImages[numbers[3]], imageBackground: $slotImageBackgrounds[3])
                        
                        CardView(image: $slotImages[numbers[4]], imageBackground: $slotImageBackgrounds[4])
                        
                        CardView(image: $slotImages[numbers[5]], imageBackground: $slotImageBackgrounds[5])
                        
                    }.padding(.horizontal, 10)
                    
                    // Row 3
                    HStack {
                        
                        CardView(image: $slotImages[numbers[6]], imageBackground: $slotImageBackgrounds[6])
                        
                        CardView(image: $slotImages[numbers[7]], imageBackground: $slotImageBackgrounds[7])
                        
                        CardView(image: $slotImages[numbers[8]], imageBackground: $slotImageBackgrounds[8])
                        
                    }.padding(.horizontal, 10)
                }
                
                Spacer()
                
                // Spin Button
                Button(action: {
                    if (self.credits > 0) {
                        
                        self.credits -= 5 * self.betAmount
                        
                        
                        self.slotImageBackgrounds = self.slotImageBackgrounds.map({ _ in
                            Color.white
                        })
                        
                        // Spin all slots
                        self.numbers = self.numbers.map({ _ in
                            Int.random(in: 0 ... self.slotImages.count - 1)
                        })
                        
                        // Check Match
                        self.checkMatch(0, 1, 2)
                        self.checkMatch(3, 4, 5)
                        self.checkMatch(6, 7, 8)
                        self.checkMatch(0, 3, 6)
                        self.checkMatch(1, 4, 7)
                        self.checkMatch(2, 5, 8)
                        self.checkMatch(0, 4, 8)
                        self.checkMatch(2, 4, 6)
                    }
                    
                    // Change Background Color to red when user runs out of credits to play
                    if (self.credits == 0) {
                        self.slotImageBackgrounds = self.slotImageBackgrounds.map({ _ in
                            Color.red
                        })
                    }
                }) {
                    VStack {
                        Text("Spin to win \(Int(10 * betAmount))")
                            .foregroundColor(.black)
                            .padding(.horizontal)
                            .padding([.top, .bottom], 10)
                            .background(Color(red: 221/255, green: 221/255, blue: 221/255))
                            .cornerRadius(20)
                    }
                }
                Text("Cost: \(Int(5 * betAmount))")
                .padding(.top, 10)
                
                Spacer()
                
            }
        }
    }
    
    func checkMatch(_ index1: Int, _ index2: Int, _ index3: Int) {
        
        if (self.numbers[index1] == self.numbers[index2]) && (self.numbers[index2] ==  self.numbers[index3]) {
            
            self.slotImageBackgrounds[index1] = Color.green
            self.slotImageBackgrounds[index2] = Color.green
            self.slotImageBackgrounds[index3] = Color.green
            
            self.credits += self.betAmount * 10.0
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            GameView()
        }
    }
}
