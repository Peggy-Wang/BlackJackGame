//
//  Card.swift
//  BlackJackGame
//
//  Created by 花逢坂詩織 on 2021/2/25.
//

import Foundation
import SwiftUI

var cards1 = initCards()
var cards2 = disorder(cards: &cards1)

struct Card: Identifiable {
    var suit: Suit  // 花色
    var cardType: CardType  // 类型(A/2-10/JQK)
    var point: Int  // 点数
    var id = UUID()
}

enum Suit {
    case spade
    case heart
    case diamond
    case club
}

enum CardType {
    case Ace
    case Number
    case J
    case Q
    case K
}

// 打印
func printCard(card: Card) {
    print("花色：\(card.suit)")
    print("类型：\(card.cardType)")
    print("点数：\(card.point)")
}

// 初始化某一种花色的牌
func initType(suit: Suit) -> [Card] {
    var cards = [Card]()
    // 初始化A
    cards.append(Card(suit: suit, cardType: .Ace, point: 1))
    // 初始化2-10
    for index in 2...10 {
        cards.append(Card(suit: suit, cardType: .Number, point: index))
    }
    // 初始化JQK
    cards.append(Card(suit: suit, cardType: .J, point: 10))
    cards.append(Card(suit: suit, cardType: .Q, point: 10))
    cards.append(Card(suit: suit, cardType: .K, point: 10))
    return cards
}

// 初始化一副牌
func initCards() -> [Card] {
    let spadeCards = initType(suit: .spade)
    let heartCards = initType(suit: .heart)
    let diamondCards = initType(suit: .diamond)
    let clubCards = initType(suit: .club)
    return spadeCards + heartCards + diamondCards + clubCards
}

// 洗牌: 按顺序从第一张牌到最后一张牌与随机一张牌交换位置
func disorder(cards: inout [Card]) -> [Card] {
    for index in 0..<52 {
        let rand = Int(arc4random_uniform(UInt32(cards.count)))
        let temp = cards[index]
        cards[index] = cards[rand]
        cards[rand] = temp
    }
    return cards
}

// 获取图片编号
func getImagesNumber(suit: Suit, point: Int, cardType: CardType) -> Int {
    if cardType == .Ace || cardType == .Number {
        switch suit {
        case .spade:
            return point
        case .heart:
            return 13 + point
        case .diamond:
            return 26 + point
        case .club:
            return 39 + point
        }
    } else {
        switch suit {
        case .spade:
            switch cardType {
            case .J:
                return 11
            case .Q:
                return 12
            case .K:
                return 13
            default:
                return 0
            }
        case .heart:
            switch cardType {
            case .J:
                return 24
            case .Q:
                return 25
            case .K:
                return 26
            default:
                return 0
            }
        case .diamond:
            switch cardType {
            case .J:
                return 37
            case .Q:
                return 38
            case .K:
                return 39
            default:
                return 0
            }
        case .club:
            switch cardType {
            case .J:
                return 50
            case .Q:
                return 51
            case .K:
                return 52
            default:
                return 0
            }
        }
    }
}

// 是否为黑杰克
func isBlackJack(index: Int) -> Bool {
    return (isTypeAce(card: cards2[index]) && isTypeT(card: cards2[index + 1])) || (isTypeAce(card: cards2[index + 1]) && isTypeT(card: cards2[index]))
}

func isTypeAce(card: Card) -> Bool {
    return card.cardType == .Ace
}

func isTypeT(card: Card) -> Bool {
    return card.cardType == .J || card.cardType == .Q || card.cardType == .K
}



