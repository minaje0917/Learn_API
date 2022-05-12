//
//  Article.swift
//  Study_API
//
//  Created by 선민재 on 2022/04/30.
//

import Foundation


struct Article: Codable {
    var author:String?
    var title: String?
    var description:String?
    var url:String?
    var urlToImage:String?
    var publishedAt:String?
}
