//
//  Hand.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 07/10/2023.
//

import UIKit

class Hand: UIView {
    
    private let youOrBot: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = .robotoBold40()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(text: String, textColor: UIColor, background: UIColor){
        self.init()
        
        backgroundColor = background
        youOrBot.text = text
        youOrBot.textColor = textColor
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(youOrBot)
    }
}

//MARK: - SetConstraints

extension Hand {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            youOrBot.centerXAnchor.constraint(equalTo: centerXAnchor),
            youOrBot.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}
