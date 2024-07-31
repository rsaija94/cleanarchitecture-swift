//
//  ProductRepository.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import Foundation
protocol NewsRepository {
    func fetchNews(newsModelRequest: NewsModelRequest,completion: @escaping (NewsResponse?, Error?) -> Void)
}

class NewsRepositoryImpl:NewsRepository {
    
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

