//
//  webservice_async.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 28/11/23.
//

import Foundation

enum WebserviceAsyncErrors: LocalizedError {
    case invalidUrl, badRequest, decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl: return "URL inválida."
        case .badRequest: return "Falha na requisição."
        case .decodingError: return "Erro ao decodificar JSON."
        }
    }
}

protocol WebServiceAsyncProtocol {
    func getProducts(url: AppConstants.Urls) async throws -> ProductList
}

class WebserviceAsync: WebServiceAsyncProtocol {
    func getProducts(url: AppConstants.Urls) async throws -> ProductList {
        guard let url = URL(string: url.rawValue) else {
            throw WebserviceAsyncErrors.invalidUrl
        }
        let (data, _) = try await URLSession.shared.data(from: url)
        let result = try JSONDecoder().decode(ProductList.self, from: data)
        return result
    }
    
    func parallelRequest(url1: URL, url2: URL) async throws -> ProductList {
        // async let realiza as requests em paralelo
        async let (data1, _) = URLSession.shared.data(from: url1)
        async let (data2, _) = URLSession.shared.data(from: url2)
        
        // e ao usar, precisamos usar try e await, pois pode não ter completado ainda
        print("data1 finished: \(try await data1)")
        print("data1 finished: \(try await data2)")
        
        let result = try await JSONDecoder().decode(ProductList.self, from: data1)
        
        return result
    }
    
    func concurrentRequest(url1: URL, url2: URL) async throws -> ProductList {
        // já o formato abaixo realiza a request 1 e, quando acaba, realiza a 2
        let (data1, _) = try await URLSession.shared.data(from: url1)
        let (_, _) = try await URLSession.shared.data(from: url2)
        
        let result = try JSONDecoder().decode(ProductList.self, from: data1)
        
        return result
    }
}
