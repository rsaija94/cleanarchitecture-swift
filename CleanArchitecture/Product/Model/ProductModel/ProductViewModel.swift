//
//  ViewProduct.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import Foundation

@Observable
class ProductViewModel:ObservableObject {
    var arrProduct:[Product]?
    var addedProduct:AddProduct?
    var newsResponse:NewsResponse?
    let productUseCaseImpl = ProductUseCaseImpl(repository: ProductRepositoryImpl())
    
    init(arrProduct: [Product]? = nil, addedProduct: AddProduct? = nil, newsResponse: NewsResponse? = nil) {
        self.arrProduct = arrProduct
        self.addedProduct = addedProduct
        self.newsResponse = newsResponse
    }
    
    func fetchProducts() {
        productUseCaseImpl.fetchProduct { (product,error) in
            if error == nil {
                self.arrProduct = product
            }
            else {
                print("error is:\(error?.localizedDescription ?? "")")
            }
        }
    }
    
    func addProduct(product:AddProduct) {
        productUseCaseImpl.addProduct(product: product) { addedProduct, error in
            if error == nil {
                self.addedProduct = addedProduct
            }
            else {
                print("error is:\(error?.localizedDescription ?? "")")
            }
        }
    }
    
    func fetchNews(newsRequest:NewsModelRequest) {
        productUseCaseImpl.fetchNews(newsModelRequest: newsRequest) { newsResponse, error in
            if error == nil {
                self.newsResponse = newsResponse
            }
            else {
                print("error is:\(error?.localizedDescription ?? "")")
            }
        }
    }
}
