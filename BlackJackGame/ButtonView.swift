//
//  ButtonView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/26.
//

import SwiftUI

struct ButtonView: View {
    let text: String
    let width: CGFloat
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .shadow(radius: 8)
                .foregroundColor(Color(red: 225/255, green: 255/255, blue: 255/255))
                .frame(width: width,
                       height: UIScreen.main.bounds.width * 1/8)
            Text(text)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.secondary)
        }
    }
}

struct Button_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "跟牌", width: UIScreen.main.bounds.width * 4/5)
    }
}
