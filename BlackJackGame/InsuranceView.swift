//
//  InsuranceView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/26.
//

import SwiftUI

struct InsuranceView: View {
    @EnvironmentObject var data: Data
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(red: 238/255, green: 238/255, blue: 238/255))
            
            VStack {
                Text("是否购买保险")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.secondary)
                
                HStack {
                    Button(action: {
                        data.isPurchasedInsurance = true
                        data.insurance = false
                        data.playerGold -= data.wager * 1/2
                        data.dealerGold += data.wager * 1/2
                    }) {
                        ButtonView(text: "是", width: UIScreen.main.bounds.width * 1/3)
                    }
                    .padding(.trailing)
                    
                    Button(action: {
                        data.insurance = false
                    }) {
                        ButtonView(text: "否", width: UIScreen.main.bounds.width * 1/3)
                    }
                }
            }
        }
        .frame(width: UIScreen.main.bounds.width * 6/7,
               height: UIScreen.main.bounds.width * 2/5)
    }
}

struct InsuranceView_Previews: PreviewProvider {
    static var previews: some View {
        InsuranceView().environmentObject(Data())
    }
}
