//
//  ChangeWagerView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/27.
//

import SwiftUI

struct ChangeWagerView: View {
    @EnvironmentObject var data: Data
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            VStack {
                Stepper("下注金额 : \(data.wager)", value: $data.wager, in:0...data.playerGold)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .frame(width: UIScreen.main.bounds.width * 2/3)
                    .padding()
                
                Button(action: {
                    data.changeWager = false
                    // 扣除赌注
                    data.playerGold -= data.wager
                    data.dealerGold -= data.wager
                }) {
                    ButtonView(text: "确认", width: UIScreen.main.bounds.width * 2/3)
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 6/7,
               height: UIScreen.main.bounds.width * 2/5)
    }
}

struct ChangeWagerView_Previews: PreviewProvider {
    static var previews: some View {
        ChangeWagerView().environmentObject(Data())
    }
}
