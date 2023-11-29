//
//  manager_async.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/11/23.
//

import Foundation

protocol ManagerAsyncProtocol {
    func getProductList() async throws -> ProductList
}

class ManagerAsync: ManagerAsyncProtocol {
    let webservice: WebServiceAsyncProtocol
    
    init(webservice: WebServiceAsyncProtocol = WebserviceAsync()) {
        self.webservice = webservice
    }
    
    func getProductList() async throws -> ProductList {
        try await webservice.getProducts(url: AppConstants.Urls.productList)
    }
}
