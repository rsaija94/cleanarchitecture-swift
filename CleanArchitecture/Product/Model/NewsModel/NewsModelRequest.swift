//
//  NewsModel.swift
//  ApiCallingSwiftUI
//
//  Created by mind on 27/02/24.
//

import Foundation
struct NewsModelRequest:Codable {
    var q:String
    var from:String
    var sortBy:String
    var apiKey:String
}
  
