//
//  webservice_closure.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import Foundation

enum WebserviceClosureErrors: LocalizedError {
    case invalidUrl, badRequest, decodingError
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl: return "URL inválida."
        case .badRequest: return "Falha na requisição."
        case .decodingError: return "Erro ao decodificar JSON."
        }
    }
}

protocol WebServiceClosureProtocol {
    func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void)
}

class Webservice: WebServiceClosureProtocol {
    func getProducts(url: AppConstants.Urls, completion: @escaping (Result<ProductList, Error>) -> Void) {
        guard let url = URL(string: url.rawValue) else {
            completion(.failure(WebserviceClosureErrors.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data else {
                completion(.failure(WebserviceClosureErrors.badRequest))
                return
            }
            guard let list = try? JSONDecoder().decode(ProductList.self, from: data) else {
                completion(.failure(WebserviceClosureErrors.badRequest))
                return
            }
            completion(.success(list))
        }.resume()
    }
}
