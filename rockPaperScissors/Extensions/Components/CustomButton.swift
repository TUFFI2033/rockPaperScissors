//
//  CustomButton.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 22/10/2023.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, font: UIFont? = .robotoBold36()) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        titleLabel?.font = font
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        backgroundColor = .specialYellow
        tintColor = .specialBackground
        translatesAutoresizingMaskIntoConstraints = false
    }
}
