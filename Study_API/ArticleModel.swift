//
//  ArticleModel.swift
//  Study_API
//
//  Created by 선민재 on 2022/04/30.
//

import Foundation

protocol ArticleModelProtocol {
    func articleRetrieved(article:[Article])
}

class ArticleModel {
    
    var delegate:ArticleModelProtocol?
    
    func getArticles() {
        // 1. 먼저 요청할 url를 String으로 담아둔다.
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=c98744baeb8e4146b1007981eed8056d"
        // 2. 해당 스트링으로 URL인스턴스를 생성해주세요.
        let url = URL(string: urlString)
        // 3. 해당 url이 만약에 nil값이라면 이곳에서 중지한다.
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        // 4. URLSession을 만들어준다.
        let session = URLSession.shared
        // 5. 
    }
    delegate?.articleRetrieved(article: [Article])
}
