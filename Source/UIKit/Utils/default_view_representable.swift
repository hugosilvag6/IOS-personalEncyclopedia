//
//  default_view_representable.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI
import UIKit

struct DefaultViewRepresentable: UIViewRepresentable {
    let view: UIView
    func makeUIView(context: Context) -> some UIView { view }
    func updateUIView(_ uiView: UIViewType, context: Context) {}
}
