//
//  viewModel_closure.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import Foundation

class viewModel_closure: ObservableObject {
    @Published var products: [Product] = []
    var manager: ManagerClosureProtocol
    
    init(manager: ManagerClosureProtocol = ManagerClosure()) {
        self.manager = manager
        getProductList()
    }
}

extension viewModel_closure {
    func getProductList() {
        guard products.isEmpty else { return }
        manager.getProductList { result in
            switch result {
            case .success(let list):
                DispatchQueue.main.async {
                    self.products = list.products
                }
            case .failure(let error): print("error: \(error)")
            }
        }
    }
}
