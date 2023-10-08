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
    case rock, paper, scissors, random
    
    func getResult(oposite: Sign) -> GameState {
        switch (self, oposite) {
        case (.rock, .rock),
            (.paper, .paper),
            (.scissors, .scissors):
            return .draw
        case (.rock, .scissors),
            (.paper, .rock),
            (.scissors, .paper):
            return .win
        default :
            return .lose
        }
    }
}
    


var imgRandom: UIImage {
    switch randomSign() {
    case .rock:
        UIImage(named: "handRockSpecialBackground")!
    case .paper:
        UIImage(named: "handPaperSpecialBackground")!
    default:
        UIImage(named: "handSccisorsSpecialBackground")!
    }
}

var imageHand: UIImage {
    let sign = randomSign()
    
    switch sign {
    case .rock:
        return UIImage(named: "handRockSpecialBackground")!
    case .paper:
        return UIImage(named: "handPaperSpecialBackground")!
    case .scissors:
        return UIImage(named: "handSccisorsSpecialBackground")!
    case .random:
        return imgRandom
    }
}
