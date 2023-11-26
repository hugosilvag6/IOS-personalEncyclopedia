//
//  breathing_flower_with_emitter.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct breathing_flower_with_emitter: View {
    @State private var petal = false
    @State private var breathInLabel = true
    @State private var breathOutLabel = false
    @State private var offsetBreath = false
    @State private var diffuseBreath = false
    @State private var breathTheBouquet = false
    
    var body: some View {
        ZStack {
            
            Image("winterNight")
                .resizable()
                .scaledToFill()
                .frame(width: 400, height: 900)
            
            SnowView()
            
            ZStack {
                Group {
                    Text("Breath In")
                        .font(.custom("papyrus", size: 35))
                        .foregroundColor(.green)
                        .opacity(breathInLabel ? 0 : 1)
                        .scaleEffect(breathInLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathInLabel)
                    
                    Text("Breath Out")
                        .font(.custom("papyrus", size: 35))
                        .foregroundColor(.orange)
                        .opacity(breathOutLabel ? 0 : 1)
                        .scaleEffect(breathOutLabel ? 0 : 1)
                        .offset(y: -160)
                        .animation(.easeIn(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathOutLabel)
                }
                
                Group {
                    Image("smoke")
                        .resizable()
                        .frame(width: 35, height: 125)
                        .offset(y: offsetBreath ? 90 : 0)
                        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: offsetBreath)
                        .blur(radius: diffuseBreath ? 1 : 60)
                        .offset(x: 0, y: diffuseBreath ? -50 : -100)
                        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: diffuseBreath)
                }
                .shadow(radius: diffuseBreath ? 20 : 0)
                
                Group {
                    PetalView(petal: $petal, degrees: petal ? -25 : -5)
                    Image("petal")
                        .resizable()
                        .frame(width: 75, height: 125)
                    PetalView(petal: $petal, degrees: petal ? 25 : 5)
                    PetalView(petal: $petal, degrees: petal ? -50 : -10)
                    PetalView(petal: $petal, degrees: petal ? 50 : 10)
                }
                
                Group {
                    Image("bouquet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(37))
                        .offset(x: -25, y: 90)
                        .scaleEffect(breathTheBouquet ? 1.04 : 1, anchor: .center)
                        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                    Image("bouquet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 400)
                        .rotationEffect(.degrees(32))
                        .offset(x: -20, y: 95)
                        .rotation3DEffect(.degrees(180), axis: (x: 0, y: 1, z: 0))
                        .scaleEffect(breathTheBouquet ? 1.02 : 1, anchor: .center)
                        .hueRotation(.degrees(breathTheBouquet ? -50 : 300))
                        .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: breathTheBouquet)
                }
            }
        }
        .onAppear {
            breathInLabel.toggle()
            breathOutLabel.toggle()
            diffuseBreath.toggle()
            offsetBreath.toggle()
            petal.toggle()
            breathTheBouquet.toggle()
        }
    }
}

struct breathing_flower_with_emitter_Previews: PreviewProvider {
    static var previews: some View {
        breathing_flower_with_emitter()
    }
}

fileprivate struct PetalView: View {
    @Binding var petal: Bool
    var degrees: Double = 0.0
    
    var body: some View {
        Image("petal")
            .resizable()
            .frame(width: 75, height: 125)
            .rotationEffect(.degrees(petal ? degrees : degrees), anchor: .bottom)
            .animation(.easeInOut(duration: 2).delay(2).repeatForever(autoreverses: true), value: petal)
    }
}

fileprivate struct SnowView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        // configure the screen
        let screen = UIScreen.main.bounds
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screen.width, height: screen.height))
        view.layer.masksToBounds = true
        
        // configure the emitter
        let emitter = CAEmitterLayer()
        emitter.frame = CGRect(x: 200, y: -100, width: view.frame.width, height: view.frame.height)
        
        // configure the cell
        let cell = CAEmitterCell()
        cell.birthRate = 40
        cell.lifetime = 25
        cell.velocity = 60
        cell.scale = 0.025
        cell.emissionRange = CGFloat.pi
        cell.contents = UIImage(named: "snow")?.cgImage
        
        emitter.emitterCells = [cell]
        view.layer.addSublayer(emitter)
        
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
