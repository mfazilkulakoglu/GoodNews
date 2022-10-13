//
//  Article.swift
//  GoodNews
//
//  Created by Mehmet  Kulakoğlu on 13.10.2022.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
       let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=5d7df3135dc84f3693e37eda29ed3af1")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String?
}
