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
    
    convenience init(text: String) {
        self.init(type: .system)
        setTitle(text, for: .normal)
        configure()
    }
    
    private func configure() {
        layer.cornerRadius = 10
        backgroundColor = .specialYellow
        titleLabel?.font = .robotoBold36()
        tintColor = .specialBackground
        titleLabel?.numberOfLines = 0
        titleLabel?.textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
