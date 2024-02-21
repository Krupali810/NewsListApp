//
//  ArticleListViewModel.swift
//  NewsListApp
//
//  Created by Krupali Patel on 11/14/23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [ArticleModel]?
}

extension ArticleListViewModel {
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles?.count ?? 0
    }
    
    func articleForIndexAt(_ index: Int) -> ArticleViewModel? {
        guard let articles = articles else { return nil }
        if index < articles.count {
            let article = articles[index]
            return ArticleViewModel(article)
        }
        return nil
    }
}

struct ArticleViewModel {
    private let articleModel: ArticleModel
    
    var title: String? {
        return self.articleModel.title
    }
    
    var description: String? {
        return self.articleModel.description
    }
}

extension ArticleViewModel {
    init(_ article: ArticleModel) {
        self.articleModel = article
    }
}
