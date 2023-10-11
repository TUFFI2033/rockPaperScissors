//
//  Sign.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 07/10/2023.
//

import UIKit

func randomSign() -> Sign {
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

enum Sign {
    
    case rock, paper, scissors
    
    func getResult(oposite: Sign) -> GameState {
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

    var imageHand: UIImage {
        
        switch self {
        case .rock:
            return UIImage(named: "rockHandSpecialBackgroundBot")!
        case .paper:
            return UIImage(named: "handPaperSpecialBackgroundBot")!
        case .scissors:
            return UIImage(named: "handSccisorsSpecialBackgroundBot")!
        }
    }
}


