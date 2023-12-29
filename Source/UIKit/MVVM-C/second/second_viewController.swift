//
//  second_viewController.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/12/23.
//

import UIKit

class SecondViewController: UIViewController {
    
    var viewModel: SecondViewModel? {
        didSet { viewModel?.delegate = self }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    @objc func buttonTapped() {
        viewModel?.goToSecond()
    }
}

extension SecondViewController: SecondViewModelDelegate {
    func someEvent(state: SecondState) {
        print("state: \(state)")
    }
}
