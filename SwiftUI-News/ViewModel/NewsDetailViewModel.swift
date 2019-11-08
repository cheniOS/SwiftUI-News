//
//  NewsDetailViewModel.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import Combine
class NewsDetailViewModel: ObservableObject {
      @Published var newsDetailsModel : NewsDetailsModel?
      @Published var content : String = ""
    func getNewsDetails( newsId : String)  {
              NewsRequestManager.getRequest(url: NewsRequestManager.getNewsDetailsData(newsId: newsId), success: { (result) in
                  do{
                      let decoder    = JSONDecoder()
                      let res        = try decoder.decode(NewsDetailsModel.self, from: result as! Data )
                   self.newsDetailsModel = res
                    self.content = self.newsDetailsModel?.data.content ?? ""
                  }catch{

                  }
              }) { (error) in
                  
              }
             
          }
}

 
