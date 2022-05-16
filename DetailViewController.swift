//
//  DetailViewController.swift
//  Study_API
//
//  Created by 선민재 on 2022/05/11.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    var url: String?
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        guard self.url != nil else {
            return
        }
        
        let url = URL(string: self.url!)
        
        guard url != nil else {
            return
        }
        
        let urlRequest = URLRequest(url: url!)
        self.spinner.alpha = 1
        self.spinner.startAnimating()
        webView.load(urlRequest)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}


extension DetailViewController:WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        self.spinner.stopAnimating()
        self.spinner.alpha = 0
    }
}
