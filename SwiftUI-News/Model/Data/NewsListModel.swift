//
//  NewsListModel.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct NewsListModel : Codable {
    var code : Int
    var msg : String
    var data : [DataItem]
    struct DataItem  : Codable ,Identifiable {
        
        var title : String?
        var source : String?
         var postTime : String?
        var imgList : Array<String>?
        var id : String
        enum CodingKeys : String , CodingKey {
            case title = "title"
             case source = "source"
             case postTime = "postTime"
            case imgList = "imgList"
             case id = "newsId"
        }
       
    }
}

 
