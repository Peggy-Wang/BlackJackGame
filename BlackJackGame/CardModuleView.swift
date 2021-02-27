//
//  CardModuleView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/25.
//

import SwiftUI

struct CardModuleView: View {
    @EnvironmentObject var data: Data
    var isPlayer: Bool
    
    var body: some View {
        // 判断所有牌是否可以在一行内放下 
        if data.playerCardNumber < 5 && data.dealerCardNumber < 5 {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.75)
                    .shadow(radius: 10)
                    .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                    .frame(width: UIScreen.main.bounds.width * 6/7,
                           height: UIScreen.main.bounds.width * 2/5)
                
                VStack {
                    HStack {
                        Text(isPlayer ? "[你]" : "[庄家]")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Text(isPlayer ? "金币：\(data.playerGold)" : "金币：\(data.dealerGold)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Text("下注：\(data.wager)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 6/7)
                    if isPlayer {
                        CardListView(startIndex: 0)
                    } else {
                        CardListView(startIndex: cards2.count - 1)
                    }
                }
            }
            .padding(20)
        } else {
            // 庄家或玩家的牌数大于4张时
            // 【此部分尚未完成】
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .opacity(0.75)
                    .shadow(radius: 10)
                    .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
                    .frame(width: UIScreen.main.bounds.width * 6/7,
                           height: UIScreen.main.bounds.width * 5/9)

                VStack {
                    HStack {
                        Text(isPlayer ? "[你]" : "[庄家]")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Text(isPlayer ? "金币：\(data.playerGold)" : "金币：\(data.dealerGold)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                        Text("下注：\(data.wager)")
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.secondary)
                    }
                    Divider()
                        .frame(width: UIScreen.main.bounds.width * 6/7)

                    if isPlayer {
                        CardListView(startIndex: 0)
                        //CardListView(startIndex: 4)
                        Text("暂时无法显示4张以上的牌")
                    }
                    if !isPlayer {
                        CardListView(startIndex: cards2.count - 1)
                        //CardListView(startIndex: cards2.count - 5)
                        Text("暂时无法显示4张以上的牌")
                    }
                }
            }
            .padding(5)
        }
    }
}

struct CardModuleView_Previews: PreviewProvider {
    static var previews: some View {
        CardModuleView(isPlayer: true).environmentObject(Data())
    }
}
