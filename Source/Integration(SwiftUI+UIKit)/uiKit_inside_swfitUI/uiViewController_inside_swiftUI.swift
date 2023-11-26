//
//  uiViewController_inside_swiftUI.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import SwiftUI

struct uiViewController_inside_swiftUI: View {
    var body: some View {
        CustomUIViewController()
    }
}

struct uiViewController_inside_swiftUI_Previews: PreviewProvider {
    static var previews: some View {
        uiViewController_inside_swiftUI()
    }
}

fileprivate struct CustomUIViewController: UIViewControllerRepresentable {
    var viewController = EmptyViewController()
    
    func makeUIViewController(context: Context) -> some UIViewController { return viewController }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}

class EmptyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
    }
}
