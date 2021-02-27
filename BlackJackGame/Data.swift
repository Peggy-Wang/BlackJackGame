//
//  Data.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/25.
//

import Foundation
import SwiftUI

var encoder = JSONEncoder()
var decoder = JSONDecoder()

class Data: ObservableObject {
    @Published var playerCardNumber: Int = 2  // 玩家牌的数量
    @Published var dealerCardNumber: Int = 2  // 庄家牌的数量
    @Published var isShown: [Bool] = Array(repeating: false, count: 52)  // 每一张牌是否显示
    @Published var isVisible: Bool = false  // 庄家的暗牌是否对玩家可见
    @Published var playerBlackJack: Bool = isBlackJack(index: 0)  // 玩家黑杰克
    @Published var dealerBlackJack: Bool = isBlackJack(index: cards2.count - 2)  // 庄家黑杰克
    @Published var insurance: Bool = isTypeAce(card: cards2[cards2.count - 1])  // 激活保险条件
    @Published var isPurchasedInsurance: Bool = false  // 是否购买了保险
    @Published var changeWager: Bool = false  // 更改下注
    @Published var playerPointSum: Int = 0  // 玩家点数总和
    @Published var dealerPointSum: Int = 0  // 庄家点数总和
    // 金币
    @Published var playerGold: Int = 10  // 玩家金币数量
    @Published var dealerGold: Int = 1000  // 庄家金币数量
    @Published var wager: Int = 0  // 赌注金额
    @Published var playerGoldRunOut: Bool = false  // 玩家金币是否耗尽
    @Published var dealerGoldRunOut: Bool = false  // 庄家金币是否耗尽
    // 胜利/失败/平局条件
    @Published var isPlayerBust: Bool = false  // 玩家是否爆牌
    @Published var isDealerBust: Bool = false  // 庄家是否爆牌
    @Published var playerBiggerPointWin: Bool = false  // 玩家更大点数胜利
    @Published var dealerBiggerPointWin: Bool = false  // 庄家更大点数胜利
    @Published var playerBlackJackWin: Bool = false  // 玩家黑杰克胜利
    @Published var dealerBlackJackWin: Bool = false  // 庄家黑杰克胜利
    @Published var equalPointDraw: Bool = false  // 点数相等平局
    @Published var bothBlackJackDraw: Bool = false  // 双方黑杰克平局
    
    // 构造函数
    init() {
        for index in 0..<2 {
            isShown[index] = true
            isShown[cards2.count - 1 - index] = true
        }
        playerBlackJackWin = playerBlackJack && !dealerBlackJack
        dealerBlackJackWin = isPurchasedInsurance ? false : dealerBlackJack && !playerBlackJack
        bothBlackJackDraw = playerBlackJack && dealerBlackJack
    }
    
    // 刷新数据
    func reInit() {
        playerCardNumber = 2
        dealerCardNumber = 2
        isShown = Array(repeating: false, count: 52)
        for index in 0..<2 {
            isShown[index] = true
            isShown[cards2.count - 1 - index] = true
        }
        isVisible = false
        playerBlackJack = isBlackJack(index: 0)
        dealerBlackJack = isBlackJack(index: cards2.count - 2)
        insurance = isTypeAce(card: cards2[cards2.count - 1])
        changeWager = false
        isPurchasedInsurance = false
        playerPointSum = 0
        dealerPointSum = 0
        
        isPlayerBust = false
        isDealerBust = false
        playerBiggerPointWin = false
        dealerBiggerPointWin = false
        playerBlackJackWin = playerBlackJack && !dealerBlackJack
        dealerBlackJackWin = dealerBlackJack && !playerBlackJack
        equalPointDraw = false
        bothBlackJackDraw = playerBlackJack && dealerBlackJack
    }
    
    // 计算玩家点数和
    func calculatePlayerPointSum() -> Int {
        self.playerPointSum = 0
        for index in 0..<self.playerCardNumber {
            self.playerPointSum += cards2[index].point
        }
        return playerPointSum
    }
    // 计算庄家点数和
    func calculateDealerPointSum() -> Int {
        self.dealerPointSum = 0
        for index in 0..<self.dealerCardNumber {
            self.dealerPointSum += cards2[cards2.count - 1 - index].point
        }
        return dealerPointSum
    }
    // 检查是否爆牌
    func checkIfBust(role: String) -> Bool {
        if role == "玩家" {
            return self.calculatePlayerPointSum() > 21
        } else {
            return self.calculateDealerPointSum() > 21
        }
    }
    // 检查点数获胜者
    func checkPointWinner() {
        if self.calculatePlayerPointSum() > self.calculateDealerPointSum() {
            self.playerBiggerPointWin = true
        } else if self.calculatePlayerPointSum() < self.calculateDealerPointSum() {
            self.dealerBiggerPointWin = true
        } else {
            self.equalPointDraw = true
        }
    }
    // 玩家获胜赢的赌注
    func playerWin() {
        self.playerGold += self.wager * 2
    }
    // 玩家获胜赢的赌注
    func dealerWin() {
        self.dealerGold += self.wager * 2
    }
    // 玩家获胜赢的赌注
    func draw() {
        self.playerGold += self.wager
        self.dealerGold += self.wager
    }
}


