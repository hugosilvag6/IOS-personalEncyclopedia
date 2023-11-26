//
//  finding_view_size_without_modifier.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct finding_view_size_without_modifier: View {
    @State var screenSize: CGSize = .zero
    @State var textSize: CGSize = .zero
    @State var widthEin: CGFloat = 0
    
    var body: some View {
        GeometryReader { geo1 in
            VStack {
                Spacer()
                
                VStack {
                    Text("Tela")
                        .font(.title2)
                    Text("width: \(screenSize.width) | height: \(screenSize.height)")
                }
                .background(Color.green.opacity(0.6))
                
                
                
                VStack {
                    Text("Essa view")
                        .font(.title2)
                    
                        .background {
                            GeometryReader { geo2 in
                                HStack {}
                                    .onAppear { textSize = geo2.size }
                            }
                        }
                    Text("width: \(textSize.width) | height: \(textSize.height)")
                }
                .background(Color.red.opacity(0.6))
                
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .onAppear { screenSize = geo1.size }
        }
    }
}

struct finding_view_size_without_modifier_Previews: PreviewProvider {
    static var previews: some View {
        finding_view_size_without_modifier()
    }
}
