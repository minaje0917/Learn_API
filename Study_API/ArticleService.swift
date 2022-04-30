//
//  ArticleService.swift
//  Study_API
//
//  Created by 선민재 on 2022/04/30.
//

import Foundation


struct ArticleService: Codable {
    var status:String?
    var totalResults:Int?
    var articles:[Article]?
}
