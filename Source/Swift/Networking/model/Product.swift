//
//  Product.swift
//  personalEncyclopedia
//
//  Created by Hugo Silva on 26/11/23.
//

import Foundation

struct ProductList: Decodable {
    let products: [Product]
}

struct Product: Decodable, Identifiable {
    var id: String { UUID().uuidString }
    let name: String
    let image: String
    let regular_price: String
    let actual_price: String
    let on_sale: Bool
    let sizes: [ProductSize]
}

struct ProductSize: Decodable, Identifiable {
    var id: String { UUID().uuidString }
    let available: Bool
    let size: String
    let sku: String
}
