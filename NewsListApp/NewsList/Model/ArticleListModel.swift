//
//  ArticleListModel.swift
//  NewsListApp
//
//  Created by Krupali Patel on 11/14/23.
//

import Foundation

struct ArticleListModel: Codable {
    let articles: [ArticleModel]?
}


struct ArticleModel: Codable {
    let title : String?
    let description: String?
}
