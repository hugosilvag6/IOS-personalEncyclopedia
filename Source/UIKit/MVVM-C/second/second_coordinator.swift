//
//  second_coordinator.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/12/23.
//

import UIKit

class SecondCoordinator {
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let secondViewModel = SecondViewModel()
        secondViewModel.coordinator = self
        let secondViewController = SecondViewController()
        secondViewController.viewModel = secondViewModel
        navigationController.pushViewController(secondViewController, animated: true)
    }
}
