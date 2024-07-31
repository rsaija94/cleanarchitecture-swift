//
//  ProductEndPoint.swift
//  CleanArchitecture
//
//  Created by mind on 05/03/24.
//

import Foundation

enum NewsEndPoint {
    case news(newsModelRequest:NewsModelRequest) // GET API WITH URL ENCODING
}

// https://fakestoreapi.com/products

extension NewsEndPoint: EndPointType {
    
    var path: String {
        switch self {
        case .news:
            return ""
        }
    }
    
    var baseURL: String {
        switch self {
        case .news:
            return "https://newsapi.org/v2/everything"
        }
    }
    
    var url: URL? {
        return URL(string: "\(baseURL)\(path)")
    }
    
    var method: HTTPMethods {
        switch self {
        case .news:
            return .get
        }
    }
    
    var body: Encodable? {
        switch self {
        case .news:
            return nil
        }
    }
    
    var headers: [String : String]? {
        APIManager.commonHeaders
    }
    
    var parameters: [String : Any]? {
        switch self {
        case .news(let newsModelRequest):
            return newsModelRequest.dictionary
        }
    }
}

