//
//  GameView.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/25.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var data: Data
    @State var showRule: Bool = false
    
    var body: some View {
        ZStack {
            Image("background1")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            ZStack {
                VStack {
                    CardModuleView(isPlayer: false)
                    CardModuleView(isPlayer: true)
                    // 跟牌/停牌 信息显示界面
                    ZStack {
                        VStack {
                            HStack {
                                // 跟牌
                                Button(action: {
                                    data.playerCardNumber += 1
                                    data.isShown[data.playerCardNumber - 1].toggle()
                                    data.isPlayerBust = data.checkIfBust(role: "玩家")
                                }) {
                                    ButtonView(text: "跟牌", width: UIScreen.main.bounds.width * 2/5)
                                }
                                .padding(5)
                                
                                // 停牌
                                Button(action: {
                                    data.isVisible = true
                                    // 庄家跟牌至点数不小于17
                                    while data.calculateDealerPointSum() < 17 {
                                        data.dealerCardNumber += 1
                                        data.isShown[cards2.count - data.dealerCardNumber].toggle()
                                    }
                                    data.isDealerBust = data.checkIfBust(role: "庄家")
                                    // 若庄家没爆牌 根据点数判断获胜者
                                    if !data.isDealerBust {
                                        data.checkPointWinner()
                                    }
                                }) {
                                    ButtonView(text: "停牌", width: UIScreen.main.bounds.width * 2/5)
                                }
                                .padding(5)
                            }
                        }
                        // 保险界面
                        if data.insurance {
                            InsuranceView()
                        }
                        // 更改下注界面
                        if data.changeWager {
                            ChangeWagerView()
                        }
                        // 结果界面
                        if data.isPlayerBust {
                            ResultView(result: "你输了：你爆牌了", winner: "庄家")
                        } else if data.isDealerBust {
                            ResultView(result: "你赢了：庄家爆牌了", winner: "玩家")
                        } else if data.playerBiggerPointWin {
                            ResultView(result: "你赢了：你的点数大于庄家", winner: "玩家")
                        } else if data.dealerBiggerPointWin {
                            ResultView(result: "你输了：你的点数小于庄家", winner: "庄家")
                        } else if data.playerBlackJackWin {
                            ResultView(result: "你赢了：你达成了黑杰克", winner: "玩家")
                        } else if data.dealerBlackJackWin {
                            ResultView(result: "你输了：庄家达成了黑杰克", winner: "庄家")
                        } else if data.equalPointDraw {
                            ResultView(result: "平局：你和庄家的点数相等", winner: "none")
                        } else if data.bothBlackJackDraw {
                            ResultView(result: "平局：你和庄家同时达成了黑杰克", winner: "none")
                        }
                        // 某方金币耗尽
                        if data.playerGoldRunOut {
                            GoldRunOutView(loser: "你")
                        } else if data.dealerGoldRunOut {
                            GoldRunOutView(loser: "庄家")
                        }
                    }
                    
                    HStack {
                        // 更改下注
                        Button(action: {
                            // 加回原来的赌注
                            data.playerGold += data.wager
                            data.dealerGold += data.wager
                            data.changeWager = true
                        }) {
                            ButtonView(text: "更改下注", width: UIScreen.main.bounds.width * 2/5)
                        }
                        .padding(5)
                        
                        // 规则
                        Button(action: {
                            showRule = true
                        }) {
                            ButtonView(text: "规则", width: UIScreen.main.bounds.width * 2/5)
                        }
                        .padding(5)
                        .sheet(isPresented: $showRule, content: {
                            RuleView()
                        })
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(Data())
    }
}
