//
//  SelectionButton.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 28/10/2023.
//

import UIKit

class SelectionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(image: String) {
        self.init(type: .system)
        setImage(UIImage(named: image), for: .normal)
        configure()
    }
    
    private func configure() {
        backgroundColor = .specialPurple
        tintColor = .specialHand
        layer.cornerRadius = 20
        translatesAutoresizingMaskIntoConstraints = false
    }
}
