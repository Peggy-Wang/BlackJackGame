//
//  ResultView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/26.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var data: Data
    @State var newGame: Bool = false
    var result: String
    var winner: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            
            VStack {
                Text(result)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                Button(action: {
                    newGame = true
                    // 扣除赌注
                    data.playerGold -= data.wager
                    data.dealerGold -= data.wager
                    // 根据结果分配赌注
                    if winner == "玩家" {
                        data.playerWin()
                    } else if winner == "庄家" {
                        data.dealerWin()
                    } else {
                        data.draw()
                    }
                    // 重新洗牌 刷新数据
                    cards2 = disorder(cards: &cards1)
                    data.reInit()
                }) {
                    ButtonView(text: "确定", width: UIScreen.main.bounds.width * 2/3)
                }
                .fullScreenCover(isPresented: $newGame, content: {
                    GameView()
                })
            }
        }
        .frame(width: UIScreen.main.bounds.width * 6/7,
               height: UIScreen.main.bounds.width * 2/5)
    }
}

struct ResultView_Previews: PreviewProvider {
    static var previews: some View {
        ResultView(result: "你赢了", winner: "玩家").environmentObject(Data())
    }
}
