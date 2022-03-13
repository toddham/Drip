//
//  ContentView.swift
//  RainDrop
//
//  Created by Todd Hamilton on 8/11/21.
//

import SwiftUI

struct ContentView: View {
 
    @State var ripple = false
    @State var bigDrop = false
    @State var littleDrop = false
    var dropSpeed = 0.45
    var dropInterval = 2.0
    
    var body: some View {
        ZStack{
            
            Color(#colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1))
            
            // Big Water Drop
            Circle()
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width:10,height:10)
                .offset(x:0, y:bigDrop ? 0 : -420)
                .animation(.linear(duration: dropSpeed).delay(dropInterval).repeatForever(autoreverses: false))
                .onAppear(){
                    bigDrop.toggle()
                }
            
            // Ripple
            ZStack(alignment: .center) {
                Circle()
                    .stroke(lineWidth: ripple ? 0 : 30)
                    .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .frame(width:300, height:300)
                    .scaleEffect(ripple ? 1 : 0)
                    .animation(Animation.easeOut(duration:(dropSpeed + dropInterval)).repeatForever(autoreverses: false).delay(dropSpeed + dropInterval))
            }
            .rotation3DEffect(
                .degrees(65),
                axis: (x: 1.0, y: 0.0, z: 0.0),
                anchor: .center,
                anchorZ: 0.0,
                perspective: 1.0
            )
            .onAppear(){
                ripple.toggle()
            }
        }.ignoresSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

