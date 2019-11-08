//
//  HomeNewsCell.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/7.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI
struct HomeNewsCell: View {
    var item : NewsListModel.DataItem?
    var body: some View {
       HStack{
        VStack(alignment: .leading, spacing: 15){
            Text(item?.title ?? " ")
            HStack{
            Text(item?.source ?? "")
                .font(.caption)
                .foregroundColor(Color.gray)
                
            Text(item?.postTime ?? "")
                            .font(.caption)
                            .foregroundColor(Color.gray)
            }
        }
        if (item?.imgList != nil) {
            Spacer()
            KFImage(URL(string:item?.imgList?.first ?? ""))
                                             .resizable()
                                             .frame(width : 120 , height: 80)
                                            .padding(.top,10)
                                            .padding(.bottom,10)
        }
                                     }
                                 }
    }
 

struct HomeNewsCell_Previews: PreviewProvider {
    static var previews: some View {
        HomeNewsCell()
    }
}
