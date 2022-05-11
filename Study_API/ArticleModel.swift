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
        // 5. URLSession을 이용하여 dataTask를 만들어준다.
        let datatask = session.dataTask(with: url!) {
            (data, response, error) in
            // 6. error가 없고 data를 성공적으로 불러왔을때만 동작합니다.
            if error == nil && data != nil {
                // 7. JSON 데이터를 swift 인스턴스 객체로 바꿔주기 위해서 decoder 객체를 생성합니다.
                let decoder = JSONDecoder()
                // 8. decode함수는 예기치못한 에러를 발생할 수 있으므로 try-catch문을 작성해준다. swift에서는 do-catch문이라고 부른다.
                do {
                    // 9. try문 앞에 붙여서 JSON데이터를 이전에 만들어준 ArticleService모양의 swift 인스턴스로 파싱해준다.
                    let articleService = try decoder.decode(ArticleService.self, from: data!)
                    // 10.데이터를 성공적으로 받아왔다면 일전에 만들어놓은 ArticleRetrieved 함수를 이용해서 articles를 ViewController에 보내줍니다. 여기서 주의해야할 점은 AritcleModel의 getArticles 함수는 background thread에서 동작하고 있다. 하지만 ViewController에서 articles을 받아오면 바로 화면에 띄워줘야하기 때문에, UI관련 로직은 많은 프로세스를 요구하므로 main thread에서 articlesRetrieved 함수를 동작시켜주어야합니다. 때문에 DispatchQueue.main.async 구문읋 써 주었다.
                    DispatchQueue.main.async {
                        self.delegate?.articleRetrieved(article: articleService.article!)
                    }
                }
                catch {
                    print("Error parsing the json")
                }
            }
        }
        // 11. datatask 준비가 완료되었다면 datatask를 실행시켜줍니다.
        datatask.resume()
    }
}
