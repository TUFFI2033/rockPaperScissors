//
//  ShopCollectionViewCell.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 15/10/2023.
//

import UIKit

class ShopCollectionViewCell: UICollectionViewCell {
    
    private let skinImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let buyCoinsBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.alpha = 0.3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let buyLabel: UILabel = {
        let label = UILabel()
        label.text = "Buy"
        label.textColor = .specialWhite
        label.font = .robotoBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let coinsImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "coinsShopImage")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let costLabel: UILabel = {
        let label = UILabel()
        label.text = "10"
        label.textColor = .specialWhite
        label.font = .robotoBold20()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialGreen
            } else {
                backgroundColor = .specialPurple
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .specialPurple
        layer.cornerRadius = 10
        
        addSubview(skinImage)
        addSubview(buyCoinsBackground)
        addSubview(buyLabel)
        addSubview(coinsImage)
        addSubview(costLabel)
    }
    
    func setSkinImage(image: UIImage) {
        skinImage.image = image
    }
}

//MARK: - Set Constraints

extension ShopCollectionViewCell {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            skinImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            skinImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            skinImage.heightAnchor.constraint(equalToConstant: 70),
            skinImage.widthAnchor.constraint(equalToConstant: 70),
            
            buyCoinsBackground.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            buyCoinsBackground.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            buyCoinsBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            buyCoinsBackground.widthAnchor.constraint(equalToConstant: 65),
            
            buyLabel.topAnchor.constraint(equalTo: buyCoinsBackground.topAnchor, constant: 5),
            buyLabel.centerXAnchor.constraint(equalTo: buyCoinsBackground.centerXAnchor),
            
            coinsImage.centerXAnchor.constraint(equalTo: buyCoinsBackground.centerXAnchor),
            coinsImage.centerYAnchor.constraint(equalTo: buyCoinsBackground.centerYAnchor),
            
            costLabel.centerXAnchor.constraint(equalTo: buyCoinsBackground.centerXAnchor),
            costLabel.bottomAnchor.constraint(equalTo: buyCoinsBackground.bottomAnchor, constant: -5)
        ])
    }
}
