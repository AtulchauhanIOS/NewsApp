//
//  JsonModel.swift
//  News App
//
//  Created by Sharad Kumar on 9/27/19.
//  Copyright © 2019 Sharad Kumar. All rights reserved.
//

import Foundation
import SwiftyJSON

struct JsonModel{
    var author: String = ""
    var content: String = ""
    var Description: String = ""
    var Title: String = ""
    var url: String = ""
    var urlToImage: String = ""
    var source: String = ""
    var name: String = ""
    var id:String = ""
    var publishedAt: String = ""
    
    init(){
        
    }
    
    init(json:JSON){
        author = json["author"].stringValue
        content = json["content"].stringValue
        Description = json["description"].stringValue
        Title = json["title"].stringValue
        url = json["url"].stringValue
        let publishDate = json["publishedAt"].stringValue
        let fullNameArr = publishDate.components(separatedBy: "T")
        let date = fullNameArr[0]
        publishedAt = date
        urlToImage = json["urlToImage"].stringValue
        let jsonn = JSON(json["source"])
        id = jsonn["id"].stringValue
        name = jsonn["name"].stringValue
        
    }
    
}
