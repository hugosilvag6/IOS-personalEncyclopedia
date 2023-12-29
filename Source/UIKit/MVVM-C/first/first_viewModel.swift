//
//  first_viewModel.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/12/23.
//

import Foundation

protocol FirstViewModelDelegate {
    func someEvent(state: FirstState)
}

enum FirstState {
    case none, loading, goToHome, error(String)
}

class FirstViewModel {
    var delegate: FirstViewModelDelegate?
    var coordinator: FirstCoordinator?
    
    var state: FirstState = .none {
        didSet {
            delegate?.someEvent(state: state)
        }
    }
    
    func goToSecond() {
        coordinator?.second()
    }
}
