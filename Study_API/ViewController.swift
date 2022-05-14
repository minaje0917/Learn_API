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
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        model.getArticles()
    }
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let indexPath = tableView.indexPathsForSelectedRows
        
       // guard indexPath != nil else{
            //return
        //}
        
        //let selectedArticle = articles[indexPath!.row]
        
        //let detailVc = segue.destination as! DetailViewController
        //detailVc.url = selectedArticle.url!
   // }
    
    
}

extension ViewController: ArticleModelProtocol {
    //MARK: ArticleModelProtocol functions
    func articleRetrieved(article: [Article]) {
        print("article retirved from article model!")
        self.articles = article
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        let article = self.articles[indexPath.row]
        // TODO customize it
        cell.displayArticle(article: article)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
