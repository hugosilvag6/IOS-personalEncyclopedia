//
//  sound_playing.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI
import AVFoundation

struct sound_playing: View {
    @State var audioPlayer: AVAudioPlayer?
    
    var body: some View {
        VStack {
            Button {
                playSound(sound: "sound_playing", type: "m4a")
            } label: {
                Text("Tocar som")
            }
            
            Button {
                audioPlayer?.stop()
            } label: {
                Text("Parar de tocar")
            }
        }
    }
}

extension sound_playing {
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
}

struct sound_playing_Previews: PreviewProvider {
    static var previews: some View {
        sound_playing()
    }
}
