//
//  NewsDetailsModel.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

//struct NewsDetailsModel : Codable {
//    var code : Int
//    var msg : String
//    var data : DataItem
//    struct DataItem  : Codable  {
//
//        var title : String?
//        var content : String?
//        var ptime : String?
//        var cover : String
//
//
//    }
//}
struct NewsDetailsModel : Codable {
        var code : Int
        var msg : String
    var data  : DataItems
    struct DataItems : Codable {
        var title  : String?
        var content : String?
    }
    
}
