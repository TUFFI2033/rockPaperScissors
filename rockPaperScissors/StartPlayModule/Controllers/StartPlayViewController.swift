//
//  StartPlayViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 30/09/2023.
//

import UIKit

class StartPlayViewController: UIViewController {
    
    private lazy var pauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "pauseImage"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//    private let vsLabel: UILabel = {
//        let label = UILabel()
//        label.text = "VS"
//        label.font = .robotoBold40()
//        label.textColor = .specialWhite
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .specialPurple
        progressView.progressTintColor = .specialYellow
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.setProgress(0, animated: false)
        progressView.layer.sublayers?[1].cornerRadius = 10
        progressView.subviews[1].clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private lazy var stackSelectLabel = UIStackView()
    private lazy var rockButton = UIButton()
    private lazy var paperButton = UIButton()
    private lazy var scissorsButton = UIButton()
    private lazy var randomButton = UIButton()
    private lazy var stackPaperRandom = UIStackView()
    private let customAlertPause = CustomAlert()
    private let handRock = Hand(text: "Y\nO\nU",
                                textColor: .specialPurple,
                                background: .specialYellow)
    private let handPaper = Hand(text: "Y\nO\nU",
                                 textColor: .specialPurple,
                                 background: .specialYellow)
    private let handSccisors = Hand(text: "Y\nO\nU",
                                    textColor: .specialPurple,
                                    background: .specialYellow)
    private let handRandom = Hand(text: "Y\nO\nU",
                                  textColor: .specialPurple,
                                  background: .specialYellow)
    private let handRockBot = Hand(text: "B\nO\nT",
                                   textColor: .specialYellow,
                                   background: .specialPurple)
    private let handPaperBot = Hand(text: "B\nO\nT",
                                    textColor: .specialYellow,
                                    background: .specialPurple)
    private let handSccisorsBot = Hand(text: "B\nO\nT",
                                       textColor: .specialYellow,
                                       background: .specialPurple)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        stackSelectLabel = UIStackView(arrangedSubviews:
                                        [selectActionLabel(text: "Select an", color: .specialWhite),
                                         selectActionLabel(text: "Action", color: .specialYellow)],
                                       axis: .horizontal,
                                       spacing: 10)
        
        rockButton = creatButton(imageNamed: "rockImage")
        paperButton = creatButton(imageNamed: "paperImage")
        scissorsButton = creatButton(imageNamed: "scissorsImage")
        randomButton = creatButton(imageNamed: "randomImage")
        
        randomButton.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
        stackPaperRandom = UIStackView(arrangedSubviews: [paperButton, randomButton],
                                       axis: .vertical, spacing: 40)
        
        rockButton.addTarget(self, action: #selector(rockButtonTapped), for: .touchUpInside)
        paperButton.addTarget(self, action: #selector(paperButtonTapped), for: .touchUpInside)
        scissorsButton.addTarget(self, action: #selector(scissorsButtonTapped), for: .touchUpInside)
        randomButton.addTarget(self, action: #selector(randomButtonTapped), for: .touchUpInside)
        
//        vsLabel.isHidden = true
        progressView.isHidden = true
        handRock.isHidden = true
        handPaper.isHidden = true
        handSccisors.isHidden = true
        handRandom.isHidden = true
        handRockBot.isHidden = true
        handPaperBot.isHidden = true
        handSccisorsBot.isHidden = true
        
        view.addSubview(pauseButton)
        view.addSubview(stackSelectLabel)
        view.addSubview(stackPaperRandom)
        view.addSubview(rockButton)
        view.addSubview(scissorsButton)
//        view.addSubview(vsLabel)
        view.addSubview(progressView)
        view.addSubview(handRock)
        view.addSubview(handPaper)
        view.addSubview(handSccisors)
        view.addSubview(handRandom)
        view.addSubview(handRockBot)
        view.addSubview(handPaperBot)
        view.addSubview(handSccisorsBot)
    }
    
    private func selectActionLabel(text: String, color: UIColor) -> UILabel{
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = .robotoBold36()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func creatButton(imageNamed: String) -> UIButton {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 35
        button.setImage(UIImage(named: imageNamed), for: .normal)
        button.backgroundColor = UIColor(red: 6/255, green: 6/255, blue: 6/255, alpha: 0.3)
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    private func play(sign: Sign) {
        progressView.isHidden = false
        
        let computerSign = randomSign()
        
        switch computerSign {
        case .rock:
            handRockBot.isHidden = false
        case .paper:
            handPaperBot.isHidden = false
        case .scissors:
            handSccisorsBot.isHidden = false
        case .random:
            handPaperBot.isHidden = false
        }
        
        switch sign {
        case .rock:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            randomButton.isHidden = true
            stackSelectLabel.isHidden = true
//            vsLabel.isHidden = false
            handRock.isHidden = false
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            randomButton.isHidden = true
            stackSelectLabel.isHidden = true
//            vsLabel.isHidden = false
            handPaper.isHidden = false
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            randomButton.isHidden = true
            stackSelectLabel.isHidden = true
//            vsLabel.isHidden = false
            handSccisors.isHidden = false
        case .random:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = true
            randomButton.isHidden = true
            stackSelectLabel.isHidden = true
//            vsLabel.isHidden = false
            handRandom.isHidden = false
        }
        
        let result = sign.getResult(oposite: computerSign)
        
        switch result {
        case .start:
            print("Never")
        case .win:
            progressView.setProgress(1, animated: true)
            customAlertPause.presentCustomAlert(viewController: self, title: "YOU WIN", text: "Play again")
        case .lose:
            progressView.setProgress(0, animated: true)
            customAlertPause.presentCustomAlert(viewController: self, title: "YOU LOSE", text: "Play again")
        case .draw:
            progressView.setProgress(0.5, animated: true)
            customAlertPause.presentCustomAlert(viewController: self, title: "DRAW", text: "Play again")
        }
    }
    
    @objc private func pauseButtonTapped() {
        customAlertPause.presentCustomAlert(viewController: self, title: "Setting", text: "Resume")
    }
    
    @objc private func rockButtonTapped() {
        play(sign: .rock)
    }
    
    @objc private func paperButtonTapped() {
        play(sign: .paper)
    }
    
    @objc private func scissorsButtonTapped() {
        play(sign: .scissors)
    }
    
    @objc private func randomButtonTapped() {
        play(sign: .random)
    }
}

// MARK: - Set Constraints

extension StartPlayViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            pauseButton.heightAnchor.constraint(equalToConstant: 40),
            pauseButton.widthAnchor.constraint(equalToConstant: 40),
            pauseButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            pauseButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            stackSelectLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackSelectLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stackPaperRandom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackPaperRandom.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackPaperRandom.widthAnchor.constraint(equalToConstant: 70),
            
            paperButton.heightAnchor.constraint(equalToConstant: 70),
            
            randomButton.heightAnchor.constraint(equalToConstant: 90),
            
            rockButton.widthAnchor.constraint(equalToConstant: 70),
            rockButton.heightAnchor.constraint(equalToConstant: 70),
            rockButton.trailingAnchor.constraint(equalTo: stackPaperRandom.leadingAnchor, constant: -40),
            rockButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
            scissorsButton.widthAnchor.constraint(equalToConstant: 70),
            scissorsButton.heightAnchor.constraint(equalToConstant: 70),
            scissorsButton.leadingAnchor.constraint(equalTo: stackPaperRandom.trailingAnchor, constant: 40),
            scissorsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            
//            vsLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            vsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            
            handRock.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            handRock.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handRock.widthAnchor.constraint(equalToConstant: 70),
            handRock.topAnchor.constraint(equalTo: stackSelectLabel.bottomAnchor, constant: 60),
            
            handPaper.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            handPaper.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handPaper.widthAnchor.constraint(equalToConstant: 70),
            handPaper.topAnchor.constraint(equalTo: stackSelectLabel.bottomAnchor, constant: 60),
            
            handSccisors.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            handSccisors.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handSccisors.widthAnchor.constraint(equalToConstant: 70),
            handSccisors.topAnchor.constraint(equalTo: stackSelectLabel.bottomAnchor, constant: 60),
            
            handRandom.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            handRandom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handRandom.widthAnchor.constraint(equalToConstant: 70),
            handRandom.topAnchor.constraint(equalTo: stackSelectLabel.bottomAnchor, constant: 60),
            
            handRockBot.topAnchor.constraint(equalTo: view.topAnchor),
            handRockBot.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handRockBot.widthAnchor.constraint(equalToConstant: 70),
            handRockBot.bottomAnchor.constraint(equalTo: stackSelectLabel.topAnchor, constant: -60),
            
            handPaperBot.topAnchor.constraint(equalTo: view.topAnchor),
            handPaperBot.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handPaperBot.widthAnchor.constraint(equalToConstant: 70),
            handPaperBot.bottomAnchor.constraint(equalTo: stackSelectLabel.topAnchor, constant: -60),
            
            handSccisorsBot.topAnchor.constraint(equalTo: view.topAnchor),
            handSccisorsBot.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handSccisorsBot.widthAnchor.constraint(equalToConstant: 70),
            handSccisorsBot.bottomAnchor.constraint(equalTo: stackSelectLabel.topAnchor, constant: -60),
            
        ])
    }
}
