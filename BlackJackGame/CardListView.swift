//
//  CardListView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/26.
//

import SwiftUI

struct CardListView: View {
    @EnvironmentObject var data: Data
    let startIndex: Int
    
    var body: some View {
        HStack {
            if startIndex != cards2.count - 1 {
                CardView(card: cards2[startIndex + 0], isVisible: true)
                CardView(card: cards2[startIndex + 1], isVisible: true)
                if data.isShown[startIndex + 2] {
                    CardView(card: cards2[startIndex + 2], isVisible: true)
                }
                if data.isShown[startIndex + 3] {
                    CardView(card: cards2[startIndex + 3], isVisible: true)
                }
            } else {
                CardView(card: cards2[startIndex - 0], isVisible: true)
                if data.isVisible {
                    CardView(card: cards2[startIndex - 1], isVisible: true)
                } else {
                    CardView(card: cards2[startIndex - 1],
                             isVisible: startIndex - 1 == cards2.count - 2 ? false : true)
                }
                if data.isShown[startIndex - 2] {
                    CardView(card: cards2[startIndex - 2], isVisible: true)
                }
                if data.isShown[startIndex - 3] {
                    CardView(card: cards2[startIndex - 3], isVisible: true)
                }
            }
        }
    }
}

struct CardListView_Previews: PreviewProvider {
    static var previews: some View {
        CardListView(startIndex: 0).environmentObject(Data())
    }
}
