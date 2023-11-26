//
//  finding_view_size_with_modifier.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct finding_view_size_with_modifier: View {
    @State var textSize1: CGSize = .zero
    @State var textSize2: CGSize = .zero
    
    var body: some View {
        VStack {
            VStack {
                Text("view 1")
                    .getSize(in: $textSize1)
                Text("width: \(textSize1.width) | height: \(textSize1.height)")
            }
            .background(Color.red.opacity(0.3))
            
            VStack {
                Text("view 2")
                    .getSize(in: $textSize2)
                Text("width: \(textSize2.width) | height: \(textSize2.height)")
            }
            .background(Color.green.opacity(0.3))
            
            VStack {
                Text("soma")
                Text("width: \(textSize1.width + textSize2.width) | height: \(textSize1.height + textSize2.height)")
            }
            .background(Color.red.opacity(0.3))
        }
    }
}

fileprivate struct SizeCalculator: ViewModifier {
    
    @Binding var size: CGSize
    
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear.onAppear { size = proxy.size }
                }
            )
    }
}

fileprivate extension View {
    func getSize(in size: Binding<CGSize>) -> some View {
        modifier(SizeCalculator(size: size))
    }
}

struct finding_view_size_with_modifier_Previews: PreviewProvider {
    static var previews: some View {
        finding_view_size_with_modifier()
    }
}
