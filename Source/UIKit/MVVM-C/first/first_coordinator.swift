//
//  first_coordinator.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/12/23.
//

import UIKit

class FirstCoordinator {
    private let window: UIWindow?
    private let navigationController: UINavigationController
    
    init(window: UIWindow?) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        let firstViewModel = FirstViewModel()
        firstViewModel.coordinator = self
        let firstViewController = FirstViewController()
        firstViewController.viewModel = firstViewModel
        navigationController.pushViewController(firstViewController, animated: true)
    }
    
    func second() {
         let secondCoordinator = SecondCoordinator(navigationController: navigationController)
        secondCoordinator.start()
    }
}
