//
//  Game.swift
//  Right on target
//
//  Created by Лидия Ладанюк on 21.08.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretValue: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func restartNewRound()
    func calculateScore(with value: Int)
}

class Game: GameProtocol {
    
    var score: Int = 0
    var currentSecretValue: Int = 0
    
    var isGameEnded: Bool {
        if currentRound >= lastRound {
            return true
        } else {
            return false
        }
    }
    
    private let minSecretValue: Int
    private let maxSecretValue: Int
    private let lastRound: Int
    private var currentRound: Int = 1

    init?(startValue: Int, endValue: Int, rounds: Int) {
        guard startValue <= endValue else { return nil }
        minSecretValue = startValue
        maxSecretValue = endValue
        lastRound = rounds
        currentSecretValue = getNewSecretValue()
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        restartNewRound()
    }
    
    func restartNewRound() {
        currentSecretValue = getNewSecretValue()
        currentRound += 1
    }
    
    func getNewSecretValue() -> Int {
        (minSecretValue...maxSecretValue).randomElement()!
    }
    
    func calculateScore(with value: Int) {
        if value > currentSecretValue {
            score += 50 - value + currentSecretValue
        } else if value < currentSecretValue {
            score += 50 - currentSecretValue + value
        } else {
            score += 50
        }
    }
    

}
