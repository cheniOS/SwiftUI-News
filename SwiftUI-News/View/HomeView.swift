//
//  HomeView.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    var body: some View {
        NavigationView{
        
        VStack{
            List{
                ForEach(self.viewModel.newList   ?? self.viewModel.getDefaultItem()) { item  in
                    NavigationLink(destination: NewsDetailsView(viewModel: NewsDetailViewModel(), newsId: item.id)){
                        HomeNewsCell(item: item)
                    }
        }
      }
  }.navigationBarTitle(Text("首页"))
 }
}
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel.init())
    }
}
 
