//
//  color_animation_hue_rotation.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct color_animation_hue_rotation: View {
    @State private var shiftColors = false
    @State private var image = "dog"
    
    var body: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.vertical)
            
            VStack(spacing: 40) {
                Image(image)
                    .resizable()
                    .padding(20)
                    .frame(width: 350, height: 350)
                    .hueRotation(.degrees(shiftColors ? 360 * 2 : 0))
                imagePicker
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 2).delay(0.4).repeatForever(autoreverses: true)) {
                shiftColors.toggle()
            }
        }
    }
}

extension color_animation_hue_rotation {
    var imagePicker: some View {
        let images = ["ornament", "landscape", "dog", "dice", "cat"]
        return Picker("", selection: $image) {
            ForEach(images, id: \.self) { image in
                Text(image)
                    .foregroundColor(.white)
            }
        }
        .pickerStyle(.wheel)
        .frame(width: 300, height: 150)
        .background(Color.red.colorMultiply(.blue))
        .cornerRadius(20)
        .shadow(color: .white, radius: 5, x: 0, y: 0)
    }
}

struct color_animation_hue_rotation_Previews: PreviewProvider {
    static var previews: some View {
        color_animation_hue_rotation()
    }
}
