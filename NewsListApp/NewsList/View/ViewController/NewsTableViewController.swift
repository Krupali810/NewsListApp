//
//  NewsTableViewController.swift
//  NewsListApp
//
//  Created by Krupali Patel on 11/14/23.
//

import Foundation
import UIKit

class NewsTableViewController : UITableViewController {
   
    private var articlesViewModel: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        fetchData()
    }
    
    func fetchData() {
        WebService().getNewsArticlesListFromService { articleList in
            self.articlesViewModel = ArticleListViewModel(articles: articleList)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return articlesViewModel?.numberOfSections() ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articlesViewModel?.numberOfRowsInSection(section) ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell") as? ArticleCell
        guard let cell = cell else {
            return UITableViewCell()
        }
        let article = articlesViewModel?.articleForIndexAt(indexPath.row)
        cell.titleLabel.text = article?.title
        cell.descriptionLabel.text = article?.description
        return cell
    }
}
