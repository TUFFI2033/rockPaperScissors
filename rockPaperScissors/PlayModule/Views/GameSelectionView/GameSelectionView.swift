//
//  GameSelectionView.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 26/10/2023.
//

import UIKit

class GameSelectionView: UIView {
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0.3
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var rockSelectButton = SelectionButton(image: "rockSelect")
    private lazy var paperSelectButton = SelectionButton(image: "paperSelect")
    private lazy var sccisorsSelectButton = SelectionButton(image: "sccisorsSelect")
    
    private lazy var stackSelectButton = UIStackView(arrangedSubviews: [rockSelectButton, paperSelectButton, sccisorsSelectButton], axis: .horizontal, spacing: 20)
    
    weak var playViewController: PlayViewController?
    
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
        
        rockSelectButton.addTarget(self, action: #selector(rockSelectButtonTapped), for: .touchUpInside)
        paperSelectButton.addTarget(self, action: #selector(paperSelectButtonTapped), for: .touchUpInside)
        sccisorsSelectButton.addTarget(self, action: #selector(sccisorsSelectButtonTapped), for: .touchUpInside)
        stackSelectButton.distribution = .fillEqually
        
        addSubview(backgroundView)
        addSubview(stackSelectButton)
    }
    
    @objc private func rockSelectButtonTapped() {
        playViewController?.play(signEnum: .rock)
    }
    
    @objc private func paperSelectButtonTapped() {
        playViewController?.play(signEnum: .paper)
    }
    
    @objc private func sccisorsSelectButtonTapped() {
        playViewController?.play(signEnum: .scissors)
    }
}

//MARK: - Set Constrains

extension GameSelectionView {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            stackSelectButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            stackSelectButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9),
            stackSelectButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackSelectButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
