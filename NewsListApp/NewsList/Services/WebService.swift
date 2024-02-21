//
//  WebService.swift
//  NewsListApp
//
//  Created by Krupali Patel on 11/14/23.
//

import Foundation

class WebService {
    func getNewsArticlesListFromService(completionHandler: @escaping (([ArticleModel]?) -> ())) {
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=7b88f140c29f4fb18785643fd9796bf7"
        let url = URL(string: urlString)
        guard let url = url else {
            completionHandler(nil)
            return
        }
        URLSession.shared.dataTask(with: URLRequest(url: url)) {
            data, response, error in
            guard let data = data else {
                completionHandler(nil)
                return
            }
            do {
                let json = try JSONDecoder().decode(ArticleListModel.self, from: data)
                completionHandler(json.articles)
            }
            catch {
                completionHandler(nil)
            }
        }.resume()
    }
    
    
    func getNewsArtclesListLocal(completionHandler: (([ArticleModel]?) -> ())) {
        let localPathString = "newsApiData"
        let path = Bundle.main.path(forResource: localPathString, ofType: "json")
        guard let path = path else {
            completionHandler(nil)
            return
        }
        do {
            let data = try Data(contentsOf: URL(filePath: path), options: .mappedIfSafe)
            let json = try JSONDecoder().decode(ArticleListModel.self, from: data)
            completionHandler(json.articles)
        }
        catch {
            completionHandler(nil)
        }
    }
}
