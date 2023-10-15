//
//  ShopViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 15/10/2023.
//

import UIKit

class ShopViewController: UIViewController {
    
    private let iCraftersLabel: UILabel = {
        let label = UILabel()
        label.text = "© 2023 iCrafters Inc. All rights reserved."
        label.textColor = .specialWhite
        label.font = .robotoBold13()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let shopLabel: UILabel = {
        let label = UILabel()
        label.text = "Shop"
        label.textColor = .specialYellow
        label.font = .robotoBold36()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Close", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold26()
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let coinsView = CoinsView()
    private let shopView = ShopView()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        coinsView.updateCoinsLabel(newBalance: GameCurrencyManager.shared.getCoinsBalance())
        
        view.addSubview(shopLabel)
        view.addSubview(coinsView)
        view.addSubview(shopView)
        view.addSubview(closeButton)
        view.addSubview(iCraftersLabel)
    }
    
    @objc private func closeButtonTapped() {
        self.dismiss(animated: true)
    }
}

// MARK: - Set Constraints

extension ShopViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            shopLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            shopLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            coinsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            coinsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coinsView.heightAnchor.constraint(equalToConstant: 30),
            coinsView.widthAnchor.constraint(equalToConstant: 100),
            
            shopView.topAnchor.constraint(equalTo: shopLabel.bottomAnchor, constant: 20),
            shopView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            shopView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            shopView.bottomAnchor.constraint(equalTo: closeButton.topAnchor, constant: -20),
            
            closeButton.heightAnchor.constraint(equalToConstant: 50),
            closeButton.bottomAnchor.constraint(equalTo: iCraftersLabel.topAnchor, constant: -20),
            closeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            
            iCraftersLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            iCraftersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
