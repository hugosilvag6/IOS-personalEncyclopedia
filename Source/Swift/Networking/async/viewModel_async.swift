//
//  viewModel_async.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/11/23.
//

import Foundation

@MainActor
class viewModel_async: ObservableObject {
    @Published var products: [Product] = []
    var manager: ManagerAsyncProtocol
    
    init(manager: ManagerAsyncProtocol = ManagerAsync()) async {
        self.manager = manager
        await getProductList()
    }
}

extension viewModel_async {
    func getProductList() async {
        do {
            let productList = try await manager.getProductList()
            self.products = productList.products
        } catch {
            print(error.localizedDescription)
        }
    }
}
