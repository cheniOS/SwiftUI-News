//
//  HomeWebView.swift
//  SwiftUI-News
//
//  Created by hbz on 2019/11/8.
//  Copyright © 2019 chs. All rights reserved.
//

import SwiftUI
import WebKit
struct HomeWebView: UIViewRepresentable     {
    var html : String
    func makeCoordinator() -> Coordinator {
         Coordinator(self)
    }
     func makeUIView(context: Context) -> WKWebView{
        let webView =   WKWebView()
     
        if  UITraitCollection.current.userInterfaceStyle == .dark{
            webView.backgroundColor = .black
        }
        webView.navigationDelegate = context.coordinator
        
        webView.loadHTMLString(html, baseURL: nil)
 
           return webView
       }
    func updateUIView(_ uiView: WKWebView, context: Context) {
            
       }
    class Coordinator: NSObject ,WKNavigationDelegate {
        var webView : HomeWebView
        
         init(_ homeWebView: HomeWebView) {
                    self.webView = homeWebView
            
           
                }
        func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
            webView.reload()
        }
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
         webView.isHidden = true
            
        }
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {

                        webView.isHidden = false
                   }
            let fontFamilyStr = "document.getElementsByTagName('body')[0].style.fontFamily='Arial';"
            webView.evaluateJavaScript(fontFamilyStr, completionHandler: nil)
            webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '250%'", completionHandler: nil)
            
            
            if  UITraitCollection.current.userInterfaceStyle == .dark{
                           webView.evaluateJavaScript("document.body.style.backgroundColor=\"#000000\"", completionHandler: nil)
                           webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#ffffff'", completionHandler: nil)
                       }else{
                           webView.evaluateJavaScript("document.body.style.backgroundColor=\"#ffffff\"", completionHandler: nil)
                           webView.evaluateJavaScript("document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#000000'", completionHandler: nil)
                       }
        }
    }
    
}

struct HomeWebView_Previews: PreviewProvider {
    static var previews: some View {
        HomeWebView(html: "<p>　　最新福布斯数据显示，王健林的财富从去年1566.3亿元跌至今年的883.9亿元，排名从去年的第4位跌至今年的第14位，一年缩水682.4亿元。</p><p>　　据福布斯中国网站消息，福布斯7日发布2019年度中国富豪榜，共400位中国富豪上榜。<strong>马云以2701.1亿元的财富值蝉联榜首</strong>；年年与之“争夺”首富之位的<strong>马化腾屈居榜眼，身家为2545.5亿元</strong>；<strong>许家印则仍为探花，身家为1958.6亿元。</strong></p><p>　　退休的马云仍然稳坐富豪榜榜首，但曾经的首富王健林，就没这么滋润了。</p><p>　　根据数据统计，<strong>王健林的财富从去年1566.3亿元跌至今年的883.9亿元，排名从去年的第4位跌至今年的第14位，一年缩水682.4亿元</strong>，连前十名都没进。他应该是“钱包”缩水最“惨”的富豪之一。</p><p>　　<b>小工具：</b><!--link0--></p><!--IMG#0--><p>　　而就在前几日，王健林唯一的儿子王思聪，还爆出被列入被执行人名单，涉及1.51亿元财产遭执行。</p><p>　　这俩位曾在资本市场叱咤风云的父子是否正面临新的危机？一时间各种揣测甚嚣尘上。</p><p>　　<strong>从买买买到卖卖卖</strong></p><p>　　<strong>遭遇“滑铁卢”后首富的跌落</strong></p><p>　　2017年，福布斯全球富豪排行榜发布，王健林以净资产313亿美元超过李嘉诚，成为亚洲首富。</p><p>　　根据媒体的统计，截止2017年初，王健林已经拥有200多个万达广场、10多个万达城、80多家五星级酒店、1300多家全球影院、2家美国电影公司、1家英国游艇公司、不计其数的名画古玩&hellip;&hellip;</p><p>　　当时，王首富的风头正劲。</p><p>　　但很快，2017年6月22日，万达、复星集团两大千亿级市值集团同一天遭遇了“股债双杀”。万达系同步暴跌，万达电影当日收盘逼近跌停，市值缩水超60亿元。</p><p>　　一切都起源于当日的一则传闻，根据财新报道，银监会要求各家银行排查包括万达、复星、浙江罗森内里在内数家企业的授信及风险分析，排查对象多是近年来海外投资比较凶猛、在银行敞口较大的民营企业集团。</p><p>　　而万达，则是当时海外投资，尤其是对娱乐资产海外投资的典型。</p><p>　　王健林自此便开启了“财富缩水”之路。</p><p>　　中间几度传出万达资金链濒临断裂的传闻，但都被王健林更大规模的“卖卖卖”的新闻所替代了。</p><p>　　2017年7月，王健林出售13个文旅项目给融创孙宏斌，套现438.44亿元，旗下的77家酒店打包卖给了富力酒店，套现199.06亿元。</p><p>　　同月，柳南万达广场、枣庄万达广场、盐城万达广场及焦作万达广场等四个商业广场的100%股权相继被出售。北海万达广场、抚州万达广场、九江万达广场、雅安万达广场、辽阳万达广场则被民生信托持有。</p><p>　　<strong>万达开启了大规模的降杠杆之路。</strong></p><p>　　2018年1月，万达集团宣布，由腾讯联合京东、苏宁、融创等共同组成的财团投资340亿元收购万达商业14%股份。</p><p>　　2018年2月，万达电影宣布以总价77.94亿元出售12.77%的股权，阿里巴巴、文投控股入局。同月，万达还出售了体育集团旗下的海外资产——马德里竞技俱乐部17%股权。</p><p>　　随后，万达陆续清空了英国、澳大利亚、美国、西班牙等多处海外资产，接着又出让了万达文化管理100%股权。</p><p>　　2018年12月，又以27.18亿元价格卖掉了手上唯一的一张保险牌照——百年人寿9亿股股份，收购方是绿城中国。</p><p>　　2019年2月12日，万达百货把旗下所有37家门店卖给了苏宁易购，据传作价不超过80亿元。</p><p>　　一系列的操作过后，万达扩张步调放缓是显而易见的。<strong>当然，降杠杆的副产品也随之而来，即王健林的资产开始大规模缩水。</strong></p><p>　　但好消息即使，万达脱离困境的说法开始逐渐被市场认可。</p><p>　　虽说王首富“跌落”的原因诸多，但万达作为房企的艰难，放眼整个市场却并非特例。</p><p>　　<strong>银根紧缩，一年内400家房企倒闭</strong></p><p>　　<strong>房企财富洗牌来袭</strong></p><p>　　由于房地产行业的政策调整，“寒冬”来临的呼声早就传遍了市场。银根锁紧、融资难已经成为全国房企的日常。</p><p>　　据人民法院公告网的公告显示，截至到10月31日，<strong>2019年宣告破产的房地产相关企业数量为412家，平均每天1.4家房企破产。</strong><strong>单9月份公告破产的房企就高达50家。</strong></p><p>　　相比去年全年破产房企458家，显然今年的速度是明显加快了。</p><p>　　而“压死骆驼的最后一根稻草”，就是负债。</p><p>　　据恒大研究院统计，截至到2018年底，房企各主要渠道有息负债余额高达20.3万亿，预计将在2019~2021年集中到期，其中2019年到期规模便高达6.8万亿元。</p><p>　　而数据统计发现，2018-2021年，房企债券合计到期金额超过1万亿元。</p><p>　　同时，还有更多已经发生的违约事件：今年截至10月份，和房企相关的债券违约共计发生22起，累计违约金额超百亿元。</p><p>　　房地产破产企业名单中，多数是中小型企业，集中在三四线城市。虽说中小房企成了倒在最前面的“殉难者”，但其实拥有雄厚资金实力支撑的大房企日子也不好过。</p><p>　　据媒体报道，<strong>三盛宏业、银亿股份、*ST华业</strong>等房企相继出事，其中三盛宏业多个项目大面积停工，被媒体称为进入“破产”倒计时。</p><p>　　银亿集团在500亿负债的重压下，因资金链断裂而宣告破产重组。</p><p>　　*ST华业前三季度亏损50.49亿元，处于资不抵债状态。</p><p>　　随后，诸多房地产企业宣布出手项目，在云南城投接连转让的同时，SOHO中国也突然传出，准备将旗下高达80亿美元的物业出售。</p><p>　　虽然SOHO中国出售传言不管真假，但整个房企“生存艰难”的基调似乎已经定下。</p><p>　　曾几何时，中国富豪榜就是房企大佬的天下，TOP10中，除了马云、马化腾，几乎都被地产界领袖瓜分。时至今日，房市大变革，随着王健林等地产大佬的财富滑落，背后隐藏着的，或许更多是在“房住不炒”的背景下，地产界的财富大洗牌。</p><p>原标题：一年“没了”680亿！王健林成“最惨”富豪？地产界开启财富大洗牌</p><p><!--viewpoint--></p><p><!--link1--></p>")
    }
}
