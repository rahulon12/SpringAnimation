//
//  ChainedSpring.swift

//  Learning SwiftUI Spring Animations: The Basics and Beyond
//  Hint: Apply a different delay to each oval the achieve this spring effect.
//
//  Created by Amos from getstream.io
//

import SwiftUI

struct ChainedSpring: View {
    
    @State var moving = false
        
    var body: some View {
        ZStack{
            ForEach(0..<8, id: \.self) { index in
                Circle() // One
                    .stroke(lineWidth: 5)
                    .frame(width: 20 + CGFloat(30 * index), height: 20 + CGFloat(30 * index))
                    .rotation3DEffect(.degrees(75), axis: (1, 0, 0))
                    .offset(y: moving ? 150 : -180)
                    .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: true).delay(Double(index) * 0.05), value: moving)
            }
        }
        .onAppear {
            moving.toggle()
        }
    }
    
}

struct ChainedSpring_Previews: PreviewProvider {
    static var previews: some View {
        ChainedSpring()
            .preferredColorScheme(.dark)
    }
}
