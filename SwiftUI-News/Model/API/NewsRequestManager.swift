//
//  NewsRequestManager.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import Alamofire
typealias SuccessBlock = (_ result : Any) -> Void
typealias FailBlock = (_ error : Error) -> Void
public enum RootUrl : String{
      case rootUrl = "https://www.mxnzp.com/api"
  }
 public enum RequestURL : String{
      case newsType   = "/news/types"
      case newsList   = "/news/list?"
      case newDetails = "/news/details?"
  }
class NewsRequestManager: NSObject {
    
    static func getNewsListData(typeId:String,page:Int)->String{
        return RootUrl.rootUrl.rawValue + RequestURL.newsList.rawValue + "typeId=" + typeId + "&page=" + "\(page)"
    }
    static func getNewsDetailsData(newsId : String)->String{
           return RootUrl.rootUrl.rawValue + RequestURL.newDetails.rawValue  + "newsId=" + newsId
       }
    
    static  func getRequest(url : String,success : @escaping SuccessBlock,fail : @escaping FailBlock)  {
        
             debugPrint("url==="+url)
        Alamofire.request(url,
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default, headers: nil)
                          .responseJSON { (response) in
                            debugPrint(response.result)
                              if (response.error != nil){
                                  fail(response.error!)
                                 }else{
                                  success(response.data as Any)
                                }
                               }
                            

           }
}

 
