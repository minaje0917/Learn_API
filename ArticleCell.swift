//
//  ArticleCell.swift
//  Study_API
//
//  Created by 선민재 on 2022/05/12.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var headLineText: UILabel!
    @IBOutlet weak var headLineImage: UIImageView!
    var articleToDisplay: Article?
    
    
    func displayArticle(article: Article) {
        headLineText.text = ""
        headLineImage.image = nil
        headLineText.alpha = 0
        headLineImage.alpha = 0
        
        articleToDisplay = article
        
        headLineText.text = articleToDisplay!.title
        
        //이미지 url이 없는 기사가 있을수도 있습니다. image url이 없다면 여기서 함수를 종료 시킵니다.
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseOut, animations: {
            self.headLineText.alpha = 1
        }, completion: nil)
        
        guard articleToDisplay!.urlToImage != nil else {
            return
        }
        
        let urlString = articleToDisplay!.urlToImage!
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Couldn't create url object")
            return
        }
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if (error == nil && data != nil) {
                if (self.articleToDisplay!.urlToImage == urlString){
                    DispatchQueue.main.async {
                        self.headLineImage.image = UIImage(data: data!)
                        UIView.animate(withDuration:0.6, delay: 0, options: .curveEaseOut, animations: {
                            self.headLineImage.alpha = 1
                        }, completion: nil)
                    }
                }
            }
        }
        dataTask.resume()
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
