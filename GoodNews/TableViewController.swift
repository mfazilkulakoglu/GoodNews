//
//  TableViewController.swift
//  GoodNews
//
//  Created by Mehmet  Kulakoğlu on 13.10.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TableViewController: UITableViewController {

    let disposeBag = DisposeBag()
    
    private var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        populateNews()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("Could not create cell")
        }
        cell.titleLabel.text = self.articles[indexPath.row].title
        cell.descriptionLabel.text = self.articles[indexPath.row].description
        return cell
    }
    
    
    private func populateNews() {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=5d7df3135dc84f3693e37eda29ed3af1")!
//
//        let resource = Resource<ArticlesList>(url: url)
        
        URLRequest.load(resource: ArticlesList.all/*resource*/)
            .subscribe(onNext: { [weak self] result in
                if let result {
                    self?.articles = result.articles
                    DispatchQueue.main.async {
                        self?.tableView.reloadData()
                    }
                }
            }).disposed(by: disposeBag)
        
        
//        Observable.just(url)
//            .flatMap { url -> Observable<Data> in
//                let request = URLRequest(url: url)
//                return URLSession.shared.rx.data(request: request)
//            }.map { data -> [Article]? in
//                return try? JSONDecoder().decode(ArticlesList.self, from: data).articles
//            }.subscribe(onNext: { [weak self] articles in
//
//                if let articles = articles {
//                    self?.articles = articles
//                    DispatchQueue.main.async {
//                        self?.tableView.reloadData()
//                    }
//                }
//            }).disposed(by: disposeBag)
    }

}
