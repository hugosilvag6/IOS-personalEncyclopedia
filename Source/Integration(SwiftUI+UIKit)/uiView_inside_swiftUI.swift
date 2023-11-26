//
//  uiView_inside_swiftUI.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct uiView_inside_swiftUI: View {
    @State var currentType: CustomUIViewType = .one
    
    var body: some View {
        VStack {
            CustomUIView(text: "view ONE", type: .one, currentType: currentType)
                .fixedSize() // faz ocupar só o tamanho necessário
            CustomUIView(text: "view TWO", type: .two, currentType: currentType)
                .fixedSize() // faz ocupar só o tamanho necessário
            CustomUIView(text: "view THREE", type: .three, currentType: currentType)
                .fixedSize() // faz ocupar só o tamanho necessário
            
            Button {
                switch currentType {
                case .one: currentType = .two
                case .two: currentType = .three
                case .three: currentType = .one
                }
            } label: {
                Text("Switch currentType")
            }
            
        }
    }
}

struct uiView_inside_swiftUI_Previews: PreviewProvider {
    static var previews: some View {
        uiView_inside_swiftUI()
    }
}

enum CustomUIViewType: Equatable {
    case one, two, three
}

fileprivate struct CustomUIView: UIViewRepresentable {
    var text: String
    var type: CustomUIViewType
    var currentType: CustomUIViewType
    
    typealias UIViewType = UILabel
    
    func makeUIView(context: Context) -> UILabel {
        let lb = UILabel()
        lb.textColor = .black
        lb.numberOfLines = 1
        lb.text = text
        lb.font = UIFont.systemFont(ofSize: 20)
        return lb
    }
    
    func updateUIView(_ uiView: UILabel, context: Context) {
        if type == currentType {
            uiView.textColor = .red
        } else {
            uiView.textColor = .black
        }
    }
}
