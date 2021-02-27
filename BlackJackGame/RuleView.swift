//
//  RuleView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/26.
//

import SwiftUI

struct RuleView: View {
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 20)
                        .opacity(0.75)
                        .shadow(radius: 10)
                        .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                        .frame(width: UIScreen.main.bounds.width * 5/6,
                               height: UIScreen.main.bounds.width * 5/3)
                    
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .leading) {
                            Text("21点规则：")
                                .font(.title3)
                                .fontWeight(.bold)
                                .padding(2)
                            Text("\tA代表1点（黑杰克时代表11点），数字2-10对应相等点数，JQK代表10点（统称T）。")
                                .padding(2)
                            Text("\t开局时，庄家拥有一张明牌和一张暗牌，玩家拥有两张明牌。")
                                .padding(2)
                            Text("\t此时，如果玩家拿到的是A和T，就拥有黑杰克。若庄家的明牌为T，且暗牌为A，直接翻开并拥有黑杰克；如果庄家的明牌为A，则玩家可以考虑是否买保险，保险金额为赌注的一半，（保险无论何种情况都归庄家所有）。如果庄家的暗牌为T且玩家不为黑杰克，那么翻开此牌：购买保险时，玩家得到赌注；未购买保险时，庄家得到赌注；如果不为T则保持暗牌，继续游戏。若玩家为黑杰克且庄家不为黑杰克，玩家赢得赌注；若庄家和玩家同时为黑杰克，平局，玩家拿回自己的赌注。")
                                .padding(2)
                            Text("\t接下来玩家可以根据自己目前的点数来选择是否跟牌，若跟牌后点数大于21则玩家爆掉，输掉本局，庄家赢得赌注。当玩家选择停牌时，庄家翻开暗牌，若点数小于17，持续拿牌直至点数不小于17；若点数大于17，庄家停牌。如果庄家爆掉，那庄家就输了，玩家赢得赌注；否则比点数大小，大为赢。点数相同为平局，玩家拿回自己的赌注。")
                                .padding(2)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width * 4/5,
                            height: UIScreen.main.bounds.width * 5/3)
                }
                .padding()
                
                Button(action: {
                    presentation.wrappedValue.dismiss()
                }) {
                    ButtonView(text: "返回", width: UIScreen.main.bounds.width * 4/5)
                }
            }
        }
    }
}

struct RuleView_Previews: PreviewProvider {
    static var previews: some View {
        RuleView()
    }
}
