//
//  ProductEndPoint.swift
//  CleanArchitecture
//
//  Created by mind on 05/03/24.
//

import Foundation

enum ProductEndPoint {
    case products // Module - GET
    case addProduct(product: AddProduct) // POST
    case news(newsModelRequest:NewsModelRequest) // GET API WITH URL ENCODING
}

// https://fakestoreapi.com/products

extension ProductEndPoint: EndPointType {
    
    var path: String {
        switch self {
        case .products:
            return "products"
        case .addProduct:
            return "products/add"
        case .news:
            return ""
        }
    }
    
    var baseURL: String {
        switch self {
        case .products:
            return "https://fakestoreapi.com/"
        case .addProduct:
            return "https://dummyjson.com/"
        case .news:
            return "https://newsapi.org/v2/everything"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .products, .news:
            return .get
        case .addProduct:
            return .post
        }
    }
    
    var body: Encodable? {
        switch self {
        case .products, .news:
            return nil
        case .addProduct(let product):
            return product
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .products, .addProduct:
            return nil
        case .news(let newsModelRequest):
            return newsModelRequest.dictionary
        }
    }
}
