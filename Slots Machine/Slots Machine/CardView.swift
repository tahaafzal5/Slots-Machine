//
//  CardView.swift
//  Slots Machine
//
//  Created by Taha on 7/13/20.
//  Copyright © 2020 Taha. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @Binding var image: String
    @Binding var imageBackground: Color
    
    var body: some View {
        Image(image)
            .resizable()
            .background(imageBackground)
            .opacity(0.8)
            .aspectRatio(contentMode: .fit)
            .cornerRadius(20)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: Binding.constant("cherry"), imageBackground: Binding.constant(Color.white))
    }
}
