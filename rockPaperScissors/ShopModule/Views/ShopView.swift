//
//  ShopView.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 15/10/2023.
//

import UIKit

class ShopView: UIView {
    
    private let shopCollectionView = ShopCollectionView()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = .none
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(shopCollectionView)
    }
}

//MARK: - Set Constraints

extension ShopView {
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            shopCollectionView.topAnchor.constraint(equalTo: topAnchor),
            shopCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shopCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shopCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
