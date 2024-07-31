//
//  NewsUseCase.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import Foundation

protocol NewsUseCase {
    func fetchNews(newsModelRequest: NewsModelRequest,completion: @escaping (NewsResponse?, Error?) -> Void)
}

class NewsUseCaseImpl: NewsUseCase {
    
    let repository: NewsRepository
    
    init(repository: NewsRepository) {
        self.repository = repository
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

