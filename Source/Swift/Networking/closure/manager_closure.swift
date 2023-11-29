//
//  manager_closure.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import Foundation

protocol ManagerClosureProtocol {
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void)
}

class ManagerClosure: ManagerClosureProtocol {
    let webservice: WebServiceClosureProtocol
    
    init(webservice: WebServiceClosureProtocol = Webservice()) {
        self.webservice = webservice
    }
    
    func getProductList(completion: @escaping (Result<ProductList, Error>) -> Void) {
        webservice.getProducts(url: AppConstants.Urls.productList, completion: completion)
    }
}
