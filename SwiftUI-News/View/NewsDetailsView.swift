//
//  NewsDetailsView.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct NewsDetailsView: View {
   
    @ObservedObject var viewModel = NewsDetailViewModel()
     var newsId : String!
     var body: some View {
         
        VStack(){
            Text(self.viewModel.newsDetailsModel?.data.title ?? " ")
                .font(.title)
                .padding(.leading,20)
                .padding(.top,20)
                .padding(.trailing,20)
            
            //content
            if !self.viewModel.content.isEmpty{
                 HomeWebView(html:self.viewModel.content)
                    .padding(.leading,20)
                    .padding(.trailing,20)
            }
           
            
        }.onAppear(){
            self.viewModel.getNewsDetails(newsId: self.newsId)
        }.navigationBarTitle(Text("正文"),displayMode: .inline)
        
    }
}
 
 
struct NewsDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsView(viewModel: NewsDetailViewModel(), newsId: "ETEVGCQE00018AOR")
    }
}
