//
//  manager_closure.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import Foundation

protocol HomeManagerProtocol {
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)
}

class HomeManager: HomeManagerProtocol {
    let webservice: WebServiceClosureProtocol
    
    init(webservice: WebServiceClosureProtocol = Webservice()) {
        self.webservice = webservice
    }
    
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) {
        Webservice.getProducts(url: AppConstants.Urls.productList, completion: completion)
    }
}
