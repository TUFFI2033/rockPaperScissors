//
//  CoinsView.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 15/10/2023.
//

import UIKit

class CoinsView: UIView {
    
    private let viewBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let imageCoinsView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "coinsImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let coinsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.textColor = .specialWhite
        label.font = .robotoBold20()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(viewBackground)
        addSubview(imageCoinsView)
        addSubview(coinsLabel)
    }
    
    func updateCoinsLabel(newBalance: Int) {
        coinsLabel.text = "\(newBalance)"
    }
}

// MARK: - Set Constraints

extension CoinsView {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBackground.topAnchor.constraint(equalTo: topAnchor),
            viewBackground.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            imageCoinsView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            imageCoinsView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageCoinsView.widthAnchor.constraint(equalToConstant: 22),
            
            coinsLabel.leadingAnchor.constraint(equalTo: imageCoinsView.trailingAnchor, constant: 5),
            coinsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            coinsLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
