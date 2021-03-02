//
//  GoldRunOutView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/3/2.
//

import SwiftUI

struct GoldRunOutView: View {
    @EnvironmentObject var data: Data
    @State var newGame: Bool = false
    var loser: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            
            VStack {
                Text("\(loser)输了：金币耗尽")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                Button(action: {
                    newGame = true
                    // 重新洗牌 刷新数据
                    cards2 = disorder(cards: &cards1)
                    data.reInit()
                    data.reInitGold()
                }) {
                    ButtonView(text: "重新开始", width: UIScreen.main.bounds.width * 2/3)
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

struct GoldRunOutView_Previews: PreviewProvider {
    static var previews: some View {
        GoldRunOutView(loser: "你").environmentObject(Data())
    }
}
