//
//  ViewProduct.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import Foundation

@Observable
class NewsViewModel:ObservableObject {
    var newsResponse:NewsResponse?
    let newsUseCaseImpl = NewsUseCaseImpl(repository: NewsRepositoryImpl())

    init(newsResponse: NewsResponse? = nil) {
        self.newsResponse = newsResponse
    }
    
    func fetchNews(newsRequest:NewsModelRequest) {
        newsUseCaseImpl.fetchNews(newsModelRequest: newsRequest) { newsResponse, error in
            if error == nil {
                self.newsResponse = newsResponse
            }
            else {
                print("error is:\(error?.localizedDescription ?? "")")
            }
        }
    }
}

