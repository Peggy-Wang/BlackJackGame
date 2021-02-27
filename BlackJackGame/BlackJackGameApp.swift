//
//  BlackJackGameApp.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/25.
//

import SwiftUI

@main
struct BlackJackGameApp: App {
    var body: some Scene {
        WindowGroup {
            GameView().environmentObject(Data())
        }
    }
}
