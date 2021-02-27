//
//  CardView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/25.
//

import SwiftUI

struct CardView: View {
    @EnvironmentObject var data: Data
    let card: Card
    let isVisible: Bool // true:明牌—-对玩家可见 false:暗牌--对玩家不可见
    
    var body: some View {
        // 明牌显示正面 暗牌显示反面
        if isVisible {
            Image("\(getImagesNumber(suit: card.suit, point: card.point, cardType: card.cardType))")
        } else {
            Image("b1fv")
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cards2[0], isVisible: true).environmentObject(Data())
    }
}
