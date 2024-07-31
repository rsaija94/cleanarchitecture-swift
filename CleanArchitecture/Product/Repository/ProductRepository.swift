//
//  ProductRepository.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import Foundation
protocol ProductRepository {
    func fetchProduct(completion: @escaping ([Product]?, Error?) -> Void)
    func addProduct(product: AddProduct, completion: @escaping (AddProduct?,Error?) -> Void)
    func fetchNews(newsModelRequest: NewsModelRequest,completion: @escaping (NewsResponse?, Error?) -> Void)
}

class ProductRepositoryImpl:ProductRepository {
    
    
    func fetchProduct(completion: @escaping ([Product]?, Error?) -> Void) {
        APIManager.shared.request(modelType: [Product].self, type: ProductEndPoint.products) { response in
            switch response {
            case .success(let products):
                completion(products, nil)
            case .failure(let error):
                print("Error fetching products: \(error)")
                completion(nil, error)
            }
        }
    }
    
    func addProduct(product: AddProduct, completion: @escaping (AddProduct?, Error?) -> Void) {
        APIManager.shared.request(modelType: AddProduct.self, type: ProductEndPoint.addProduct(product: product)) { response in
            switch response {
            case .success(let addProduct):
                completion(addProduct,nil)
            case .failure(let error):
                print("Error fetching products: \(error)")
                completion(nil, error)
 
            }
        }
    }
    
    func fetchNews(newsModelRequest: NewsModelRequest, completion: @escaping (NewsResponse?, Error?) -> Void) {
        APIManager.shared.request(modelType: NewsResponse.self, type: ProductEndPoint.news(newsModelRequest: newsModelRequest)) { response in
            switch response {
            case .success(let newsResponse):
                completion(newsResponse,nil)
            case .failure(let error):
                print("Error fetching news: \(error)")
                completion(nil, error)
            }
        }
    }
}
