//
//  breathing_circles.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct breathing_circles: View {
    @State private var scaleInOut = false
    @State private var rotateInOut = false
    @State private var moveInOut = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .edgesIgnoringSafeArea(.all)
            
            ZStack {
                
                // MARK: - Circles Set 1
                ZStack {
                    circle1
                    circle2
                }
                .opacity(0.5)
                
                // MARK: - Circles Set 2
                ZStack {
                    circle1
                    circle2
                }
                .opacity(0.5)
                .rotationEffect(.degrees(60))
                
                // MARK: - Circles Set 3
                ZStack {
                    circle1
                    circle2
                }
                .opacity(0.5)
                .rotationEffect(.degrees(120))
            }
            .rotationEffect(.degrees(rotateInOut ? 90 : 0))
            .scaleEffect(scaleInOut ? 1 : 1/4)
            .onAppear {
                withAnimation(.easeInOut.repeatForever(autoreverses: true).speed(1/8)) {
                    moveInOut.toggle()
                    scaleInOut.toggle()
                    rotateInOut.toggle()
                }
            }
        }
    }
}

extension breathing_circles {
    var circle1: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                     startPoint: .top,
                                     endPoint: .bottom))
            .frame(width: 120, height: 120)
            .offset(y: moveInOut ? -60 : 0)
    }
    var circle2: some View {
        Circle()
            .fill(LinearGradient(gradient: Gradient(colors: [.green, .white]),
                                     startPoint: .bottom,
                                     endPoint: .top))
            .frame(width: 120, height: 120)
            .offset(y: moveInOut ? 60 : 0)
    }
}

struct breathing_circles_Previews: PreviewProvider {
    static var previews: some View {
        breathing_circles()
    }
}
