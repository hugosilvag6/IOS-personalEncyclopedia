//
//  first_viewController.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/12/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    var viewModel: FirstViewModel? {
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

extension FirstViewController: FirstViewModelDelegate {
    func someEvent(state: FirstState) {
        print("state: \(state)")
    }
}
