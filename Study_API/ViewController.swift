//
//  ViewController.swift
//  Study_API
//
//  Created by 선민재 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController, ArticleModelProtocol {
    
    
    var model = ArticleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getArticles()
    }
    
    //MARK: ArticleModelProtocol functions
    func articleRetrieved(article: [Article]) {
        print("article retirved from article model!")   
    }
}

