//
//  ViewController.swift
//  Study_API
//
//  Created by 선민재 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]()
    var model = ArticleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getArticles()
    }
    
    
}

extension ViewController:ArticleModelProtocol {
    //MARK: ArticleModelProtocol functions
    func articleRetrieved(article: [Article]) {
        print("article retirved from article model!")
        self.articles = article
    }
}
