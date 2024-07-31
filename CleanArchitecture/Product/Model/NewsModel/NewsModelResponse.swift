//
//  NewsModelResponse.swift
//  ApiCallingSwiftUI
//
//  Created by mind on 27/02/24.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable,Identifiable {
    let id = UUID()
    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}
