//
//  ViewController.swift
//  Study_API
//
//  Created by 선민재 on 2022/04/30.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ArticleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.delegate = self
        model.getArticle()
    }
    
    //MARK: ArticleModelProtocol functions
    func articleRetrived(article: [Article]) {
        print("article retirved from article model!")   
    }
}

