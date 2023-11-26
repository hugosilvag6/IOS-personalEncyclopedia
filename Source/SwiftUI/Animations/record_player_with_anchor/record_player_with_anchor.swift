//
//  record_player_with_anchor.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI
import AVFoundation

struct record_player_with_anchor: View {
    @State private var rotateRecord = false
    @State private var rotateArm = false
    @State private var shouldAnimate = false
    @State private var degrees = 0.0
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            
            ZStack {
                recordPlayerBox
                recordView
                armView
            }
            
            playButton
        }
    }
}

extension record_player_with_anchor {
    func playSound(sound: String, type: String) {
        if let path = Bundle.main.path(forResource: sound, ofType: type) {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
                audioPlayer?.play()
            } catch {
                print("Could not find and play the sound file")
            }
        }
    }
    var recordPlayerBox: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 345, height: 345)
            Image("woodGrain")
                .resizable()
                .frame(width: 325, height: 325)
                .shadow(color: .white, radius: 3, x: 0, y: 0)
        }
    }
    var recordView: some View {
        Image("record")
            .resizable()
            .frame(width: 275, height: 275)
            .shadow(color: .gray, radius: 1, x: 0, y: 0)
            .rotationEffect(.degrees(degrees))
    }
    var armView: some View {
        Image("playerArm")
            .resizable()
            .scaledToFit()
            .frame(width: 150, height: 150)
            .shadow(color: .gray, radius: 2, x: 0, y: 0)
            .rotationEffect(.degrees(-35), anchor: .topTrailing)
            .rotationEffect(.degrees(rotateArm ? 15 : 0), anchor: .topTrailing)
            .offset(x: 70, y: -35)
    }
    var playButton: some View {
        Button {
            shouldAnimate.toggle()
            withAnimation(.linear(duration: shouldAnimate ? 60 : 0).delay(1.5)) {
                if shouldAnimate {
                    degrees = 36000
                    playSound(sound: "vitrola_add_ancora_nas_animacoes", type: "m4a")
                } else {
                    degrees = 0
                    audioPlayer?.stop()
                }
            }
            withAnimation(.linear(duration: 2)) {
                rotateArm.toggle()
            }
        } label: {
            HStack(spacing: 8) {
                if !shouldAnimate {
                    Text("Play")
                    Image(systemName: "play.circle.fill")
                        .imageScale(.large)
                } else {
                    Text("Stop")
                    Image(systemName: "stop.fill")
                        .imageScale(.large)
                }
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(Capsule().strokeBorder(lineWidth: 1.25))
        }
    }
}

struct record_player_with_anchor_Previews: PreviewProvider {
    static var previews: some View {
        record_player_with_anchor()
    }
}
