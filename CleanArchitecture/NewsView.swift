//
//  NewsView.swift
//  CleanArchitecture
//
//  Created by mind on 06/03/24.
//

import SwiftUI

struct NewsView: View {
    @StateObject var newsModel:NewsViewModel
    
    init(newsModel: NewsViewModel) {
        self._newsModel = StateObject(wrappedValue: newsModel)
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(newsModel.newsResponse?.articles ?? [], id: \.id) { article in
                    Text(article.description ?? "")
                }
            }
        }.onAppear(){
            newsModel.fetchNews(newsRequest: NewsModelRequest(q: "tesla", from: "2024-02-06", sortBy: "publishedAt", apiKey: "d994c7670b56487aa5ccaef856ad97ae"))
        }
    }
}

#Preview {
    NewsView(newsModel: NewsViewModel())
}
