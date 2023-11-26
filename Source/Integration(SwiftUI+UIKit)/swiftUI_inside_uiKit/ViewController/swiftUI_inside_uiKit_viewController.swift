//
//  swiftUI_inside_uiKit_viewController.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import UIKit
import SwiftUI

class swiftUI_inside_uiKit_viewController: UIViewController {
    var hostingController: UIHostingController<swiftUI_inside_uiKit_view>?
    
    lazy var screenView: UIView = {
        guard let hosting = hostingController, let vw = hosting.view else { return UIView() }
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupHostingController()
        setupView()
    }
}

extension swiftUI_inside_uiKit_viewController {
    func navigateToFirst() {
        let newVC = UIViewController()
        newVC.view.backgroundColor = .red
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    func navigateToSecond() {
        let newVC = UIViewController()
        newVC.view.backgroundColor = .green
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    func navigateToThird() {
        let newVC = UIViewController()
        newVC.view.backgroundColor = .blue
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    func setupHostingController() {
        let viewModel = swiftUI_inside_uiKit_viewModel()
        viewModel.first = { self.navigateToFirst() }
        viewModel.second = { self.navigateToSecond() }
        viewModel.third = { self.navigateToThird() }
        let hosting = UIHostingController(rootView: swiftUI_inside_uiKit_view(viewModel: viewModel))
        self.hostingController = hosting
        self.addChild(hostingController ?? hosting)
    }
    func setupView() {
        view.addSubview(screenView)
        NSLayoutConstraint.activate([
            screenView.topAnchor.constraint(equalTo: view.topAnchor),
            screenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            screenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
    }
}

// MARK: - Struct criada pra poder chamar ao abrir o app
struct swiftUI_inside_uiKit_UI: UIViewControllerRepresentable {
    var viewController = swiftUI_inside_uiKit_viewController()
    
    func makeUIViewController(context: Context) -> some UIViewController {
        return UINavigationController(rootViewController: viewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
