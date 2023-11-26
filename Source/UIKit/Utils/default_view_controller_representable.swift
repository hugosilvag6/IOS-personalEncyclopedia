//
//  default_view_controller_representable.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI
import UIKit

struct DefaultViewControllerRepresentable: UIViewControllerRepresentable {
    let viewController: UIViewController
    func makeUIViewController(context: Context) -> some UIViewController { viewController }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
