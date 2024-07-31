//
//  ProductUseCase.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import Foundation

protocol ProductUseCase {
    func fetchProduct(completion: @escaping ([Product]?, Error?) -> Void)
    func addProduct(product: AddProduct, completion: @escaping (AddProduct?,Error?) -> Void)
    func fetchNews(newsModelRequest: NewsModelRequest,completion: @escaping (NewsResponse?, Error?) -> Void)
}

class ProductUseCaseImpl: ProductUseCase {
    
    let repository: ProductRepository
    
    init(repository: ProductRepository) {
        self.repository = repository
    }
    
    func fetchProduct(completion: @escaping ([Product]?, Error?) -> Void) {
        return repository.fetchProduct { product, error in
            if error == nil {
                completion(product,nil)
            } else {
                completion(nil,error)
            }
        }
    }
    
    func addProduct(product: AddProduct, completion: @escaping (AddProduct?, Error?) -> Void) {
        return repository.addProduct(product: product) { product, error in
            if error == nil {
                completion(product,nil)
            } else {
                completion(nil,error)
            }
        }
    }
    
    func fetchNews(newsModelRequest: NewsModelRequest, completion: @escaping (NewsResponse?, Error?) -> Void) {
        return repository.fetchNews(newsModelRequest: newsModelRequest) { newsResponse, error in
            if error == nil {
                completion(newsResponse,nil)
            } else {
                completion(nil,error)
            }
        }
    }
}

