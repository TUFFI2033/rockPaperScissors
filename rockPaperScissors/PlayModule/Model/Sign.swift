//
//  Sign.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 07/10/2023.
//

import UIKit

class Sign {
    
    static let shared = Sign()
    private init() {}
    
    func randomSign() -> SignEnum {
        let randomChoise = Int.random(in: 0...2)
        
        switch randomChoise {
        case 0:
            return .rock
        case 1:
            return .paper
        default:
            return .scissors
        }
    }
    
    enum SignEnum {
        case rock, paper, scissors
        
        func getResult(oposite: SignEnum) -> GameState {
            switch (self, oposite) {
            case (.rock, .scissors),
                (.paper, .rock),
                (.scissors, .paper):
                print(self, oposite)
                return .win
            case (.rock, .rock),
                (.paper, .paper),
                (.scissors, .scissors):
                print(self, oposite)
                return .draw
            default :
                print(self, oposite)
                return .lose
            }
        }
    }
}

