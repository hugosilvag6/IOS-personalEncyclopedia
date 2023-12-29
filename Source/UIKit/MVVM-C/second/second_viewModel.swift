//
//  second_viewModel.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/12/23.
//

import Foundation

protocol SecondViewModelDelegate {
    func someEvent(state: SecondState)
}

enum SecondState {
    case none, loading, goToHome, error(String)
}

class SecondViewModel {
    var delegate: SecondViewModelDelegate?
    var coordinator: SecondCoordinator?
    
    var state: SecondState = .none {
        didSet {
            delegate?.someEvent(state: state)
        }
    }
    
    func goToSecond() {
        coordinator?.second()
    }
}
