//
//  Product.swift
//  Youtube MVVM Products
//
//  Created by mind on 06/03/24.
//

import Foundation

struct Product: Codable,Identifiable {
    let id: Int
    let title: String
    let price: Double
    let description: String
    let category: String
    let image: String
    let rating: Rate
}

struct Rate: Codable {
    let rate: Double
    let count: Int
}
