//
//  HomeViewModel.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import Combine
class HomeViewModel: ObservableObject {
    @Published var newList : [NewsListModel.DataItem]!
    @Published var newsDetailsModel : NewsDetailsModel.DataItems!
    init() {
        self.getNewsList()
    }
    func getNewsList()  {
        NewsRequestManager.getRequest(url: NewsRequestManager.getNewsListData(typeId: "521", page: 1), success: { (result) in
            do{
                let decoder    = JSONDecoder()
                let res        = try decoder.decode(NewsListModel.self, from: result as! Data )
                self.newList = res.data
            }catch{

            }
        }) { (error) in
            
        }
       
    }
    func getNewsDetails( newsId : String)  {
           NewsRequestManager.getRequest(url: NewsRequestManager.getNewsDetailsData(newsId: newsId), success: { (result) in
               do{
                   let decoder    = JSONDecoder()
                   let res        = try decoder.decode(NewsDetailsModel.self, from: result as! Data )
                self.newsDetailsModel = res.data
               }catch{

               }
           }) { (error) in
               
           }
          
       }
    func getDefaultItem( )->[NewsListModel.DataItem]{
        let item = NewsListModel.DataItem.init(title: "", source: "",  postTime: "", imgList: [],id:"")
               return [item]
           }
//  
}

 
