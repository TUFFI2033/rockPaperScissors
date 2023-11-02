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
        label.text = "Сhoose a way to play"
        label.font = .robotoBold40()
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.7
        label.textAlignment = .center
        label.textColor = .specialYellow
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var homeButton = CustomButton(text: "Home", font: .robotoBold20())
    private lazy var roundOneButton = ChooseRoundView(image: UIImage(named: "round1"), 
                                                      text: "Round 1", 
                                                      tapGesture: UITapGestureRecognizer(
                                                        target: self,
                                                        action: #selector(roundOneButtonTapped)))
    private lazy var roundThreeButton = ChooseRoundView(image: UIImage(named: "round3"),
                                                        text: "Round 3", 
                                                        tapGesture: UITapGestureRecognizer(
                                                            target: self,
                                                            action: #selector(roundThreeButtonTapped)))
    private lazy var roundScaleButton = ChooseRoundView(image: UIImage(named: "firstScale"),
                                                        text: "Who fills the scale first?", 
                                                        tapGesture: UITapGestureRecognizer(
                                                            target: self,
                                                            action: #selector(roundScaleButtonTapped)))
    private lazy var stackRoundButton = UIStackView(
        arrangedSubviews: [roundOneButton, roundThreeButton, roundScaleButton],
        axis: .vertical, spacing: 20)
    
    private let coinsView = CoinsView()
    private let playViewController = PlayViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        coinsView.updateCoinsLabel(newBalance: GameCurrencyManager.shared.getCoinsBalance())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
    
        homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        
        stackRoundButton.distribution = .fillEqually
        
        view.addSubview(chooseLabel)
        view.addSubview(coinsView)
        view.addSubview(homeButton)
        view.addSubview(stackRoundButton)
    }
    
    private func roundViewEfectsTapped(chooseRoundView: ChooseRoundView) {
        UIView.animate(withDuration: 0.3, animations: {
            chooseRoundView.alpha = 0.7
        }) { _ in
            UIView.animate(withDuration: 0.2) {
                chooseRoundView.alpha = 1.0
            }
        }
    }
    
    @objc private func homeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func roundOneButtonTapped() {
        playViewController.countRound = 1
        roundViewEfectsTapped(chooseRoundView: roundOneButton)
        playViewController.modalPresentationStyle = .fullScreen
        present(playViewController, animated: true)
    }
    
    @objc private func roundThreeButtonTapped() {
        playViewController.countRound = 3
        roundViewEfectsTapped(chooseRoundView: roundThreeButton)
        playViewController.modalPresentationStyle = .fullScreen
        present(playViewController, animated: true)
    }
    
    @objc private func roundScaleButtonTapped() {
        playViewController.countRound = Int.max
        roundViewEfectsTapped(chooseRoundView: roundScaleButton)
        playViewController.modalPresentationStyle = .fullScreen
        present(playViewController, animated: true)
    }
}

//MARK: - Set Constrains

extension ChooseViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            coinsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            coinsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coinsView.heightAnchor.constraint(equalToConstant: 30),
            coinsView.widthAnchor.constraint(equalToConstant: 100),
            
            chooseLabel.topAnchor.constraint(equalTo: coinsView.bottomAnchor, constant: 20),
            chooseLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            chooseLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            chooseLabel.heightAnchor.constraint(equalToConstant: 40),
            
            stackRoundButton.topAnchor.constraint(equalTo: chooseLabel.bottomAnchor, constant: 20),
            stackRoundButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackRoundButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackRoundButton.bottomAnchor.constraint(equalTo: homeButton.topAnchor, constant: -20),
            
            homeButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            homeButton.heightAnchor.constraint(equalToConstant: 40),
            homeButton.widthAnchor.constraint(equalToConstant: 150),
            homeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
