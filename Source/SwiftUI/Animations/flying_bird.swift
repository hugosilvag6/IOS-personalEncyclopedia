//
//  flying_bird.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct flying_bird: View {
    @State private var leftWing = false
    @State private var rightWing = false
    @State private var birdBody = false
    @State private var animateShadow = false
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            
            ZStack {
                Image("leftWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .red, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(leftWing ? -100 : 0), anchor: .bottomTrailing)
                    .offset(x: -55, y: leftWing ? -190 : 0)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: leftWing)
                Image("rightWing")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .shadow(color: .blue, radius: 1, x: 0, y: 3)
                    .rotationEffect(.degrees(rightWing ? 100 : 0), anchor: .bottomLeading)
                    .offset(x: 55, y: rightWing ? -190 : 0)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: rightWing)
                Image("body")
                    .resizable()
                    .frame(width: 125, height: 150)
                    .offset(y: -30)
                    .shadow(color: .white, radius: 1, x: 0, y: 0)
                    .offset(y: birdBody ? -50 : 75)
                    .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: birdBody)
            }
            .shadow(color: .white, radius: animateShadow ? 1 : 4, x: 0, y: animateShadow ? 10 : 1)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: animateShadow)
        }
        .onAppear {
            leftWing.toggle()
            rightWing.toggle()
            birdBody.toggle()
            animateShadow.toggle()
        }
    }
}

struct flying_bird_Previews: PreviewProvider {
    static var previews: some View {
        flying_bird()
    }
}
