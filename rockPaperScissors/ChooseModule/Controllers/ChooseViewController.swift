//
//  ChooseViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 22/10/2023.
//

import UIKit

class ChooseViewController: UIViewController {
    
    private let chooseLabel: UILabel = {
        let label = UILabel()
        label.text = "Chose the number of rounds to Win"
        label.font = .robotoBold40()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = .specialWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let roundOneButton = CustomButton(text: "1\nRound")
    private let roundThreeButton = CustomButton(text: "3\nRound")
    private let roundFiveButton = CustomButton(text: "5\nRound")
    private let roundScaleButton = CustomButton(text: "Scale")
    
    private lazy var stackOneThreeButton = UIStackView(arrangedSubviews: [roundOneButton, roundThreeButton],
                                                       axis: .horizontal, spacing: 20)
    private lazy var stackFiveScaleButton = UIStackView(arrangedSubviews: [roundFiveButton, roundScaleButton],
                                                        axis: .horizontal, spacing: 20)
    private lazy var stackButton = UIStackView(arrangedSubviews: [stackOneThreeButton, stackFiveScaleButton],
                                                        axis: .vertical, spacing: 20)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(chooseLabel)
        view.addSubview(stackButton)
    }
}

//MARK: - Set Constrains

extension ChooseViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            chooseLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            chooseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chooseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            chooseLabel.heightAnchor.constraint(equalToConstant: 200),
            
            stackButton.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 20),
            stackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
}
