//
//  ProductUseCaseMoc.swift
//  CleanArchitectureTests
//
//  Created by mind on 06/03/24.
//

import XCTest
@testable import CleanArchitecture
import Foundation

class ProductUseCaseMockImpl: ProductUseCase {
    
    let apiManager: APIManager
        
        init(apiManager: APIManager) {
            self.apiManager = apiManager
        }
    
    func fetchProduct(completion: @escaping ([Product]?, Error?) -> Void) {
        apiManager.request(modelType: [Product].self, type: ProductEndPoint.products) { response in
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
        apiManager.request(modelType: AddProduct.self, type: ProductEndPoint.addProduct(product: product)) { response in
            switch response {
            case .success(let addProduct):
                completion(addProduct,nil)
            case .failure(let error):
                print("Error fetching products: \(error)")
                completion(nil, error)

            }
        }
    }
}

