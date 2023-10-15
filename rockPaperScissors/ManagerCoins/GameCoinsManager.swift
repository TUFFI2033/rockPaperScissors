//
//  GameCoinsManager.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 15/10/2023.
//

import Foundation

class GameCurrencyManager {
    static let shared = GameCurrencyManager()
    
    private var coins: Int = 0

    private init() {
        coins = UserDefaults.standard.integer(forKey: "coins")
    }
    
    func getCoinsBalance() -> Int {
        return coins
    }
    
    func addCoins(_ amount: Int) {
        coins += amount
        saveCoins()
    }
    
    func subtractCoins(_ amount: Int) -> Bool {
        if coins >= amount {
            coins -= amount
            saveCoins()
            return true
        } else {
            return false
        }
    }
    
    private func saveCoins() {
        UserDefaults.standard.set(coins, forKey: "coins")
    }
}
