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
    
    private let winLoseOrDrawLabel: UILabel = {
        let label = UILabel()
        label.font = .robotoBold40()
        label.textColor = .specialWhite
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let progressView: UIProgressView = {
        let progressView = UIProgressView(progressViewStyle: .default)
        progressView.trackTintColor = .specialPurple
        progressView.progressTintColor = .specialYellow
        progressView.layer.cornerRadius = 10
        progressView.clipsToBounds = true
        progressView.setProgress(0, animated: false)
        progressView.layer.sublayers?[1].cornerRadius = 0
        progressView.subviews[1].clipsToBounds = true
        progressView.translatesAutoresizingMaskIntoConstraints = false
        return progressView
    }()
    
    private let customAlertPause = CustomAlert()
    private let customAlertSetting = CustomAlertSettingView()
    private let handYou = Hand(text: "Y\nO\nU",
                               textColor: .specialPurple,
                               background: .specialYellow)
    private let handBot = Hand(text: "B\nO\nT",
                               textColor: .specialYellow,
                               background: .specialPurple)
    private let whiteViewYou = UIView()
    private let whiteViewBot = UIView()
    private lazy var handImageYou = UIImageView()
    private let handImageBot = UIImageView()
    
    private lazy var stackSelectLabel = UIStackView()
    private lazy var rockButton = UIButton()
    private lazy var paperButton = UIButton()
    private lazy var scissorsButton = UIButton()
    private lazy var randomButton = UIButton()
    private lazy var stackPaperRandom = UIStackView()
    private let coinsView = CoinsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        whiteViewYou.backgroundColor = .specialWhite
        whiteViewBot.backgroundColor = .specialWhite
        
        coinsView.updateCoinsLabel(newBalance: GameCurrencyManager.shared.getCoinsBalance())
        
        progressView.alpha = 0
        winLoseOrDrawLabel.alpha = 0
        handYou.alpha = 0
        whiteViewYou.alpha = 0
        handImageYou.alpha = 0
        handBot.alpha = 0
        whiteViewBot.alpha = 0
        handImageBot.alpha = 0
        
        whiteViewYou.translatesAutoresizingMaskIntoConstraints = false
        whiteViewBot.translatesAutoresizingMaskIntoConstraints = false
        handImageYou.translatesAutoresizingMaskIntoConstraints = false
        handImageBot.translatesAutoresizingMaskIntoConstraints = false
        
        progressView.setProgress(0.5, animated: true)
        
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
        
        view.addSubview(pauseButton)
        view.addSubview(coinsView)
        view.addSubview(stackSelectLabel)
        view.addSubview(stackPaperRandom)
        view.addSubview(rockButton)
        view.addSubview(scissorsButton)
        view.addSubview(winLoseOrDrawLabel)
        view.addSubview(progressView)
        view.addSubview(handYou)
        view.addSubview(handBot)
        view.addSubview(whiteViewYou)
        view.addSubview(whiteViewBot)
        view.addSubview(handImageYou)
        view.addSubview(handImageBot)
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
        let computerSign = randomSign()
        
        handImageBot.image = computerSign.imageHand
        
        switch computerSign {
        case .rock:
            setupDisplayHand()
        case .paper:
            setupDisplayHand()
        case .scissors:
            setupDisplayHand()
        }
        
        switch sign {
        case .rock:
            handImageYou.image = UIImage(named: "rockHandSpecialBackground")
            setupDisplayHand()
        case .paper:
            handImageYou.image = UIImage(named: "handPaperSpecialBackground")
            setupDisplayHand()
        case .scissors:
            handImageYou.image = UIImage(named: "handSccisorsSpecialBackground")
            setupDisplayHand()
        }
        
        let result = sign.getResult(oposite: computerSign)
        let currentProgress = self.progressView.progress
        
        switch result {
        case .start:
            print("Never")
        case .win:
            winLoseOrDrawLabel.text = "WIN!"
            winLoseOrDrawLabel.textColor = .specialYellow
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                UIView.animate(withDuration: 0.8) {
                    self.progressView.setProgress(currentProgress + 0.25, animated: true)
                }
            }
        case .lose:
            winLoseOrDrawLabel.text = "LOSE!"
            winLoseOrDrawLabel.textColor = .specialPurple
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                UIView.animate(withDuration: 0.8) {
                    self.progressView.setProgress(currentProgress - 0.25, animated: true)
                }
            }
        case .draw:
            winLoseOrDrawLabel.textColor = .specialWhite
            winLoseOrDrawLabel.text = "DRAW!"
        }
    }
    
    private func setupDisplayHand() {
        
        UIView.animateKeyframes(withDuration: 6.5, delay: 0.0) {
            
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.05) {
                self.rockButton.alpha = 0
                self.paperButton.alpha = 0
                self.scissorsButton.alpha = 0
                self.randomButton.alpha = 0
                self.stackSelectLabel.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.1, relativeDuration: 0.15) {
                self.handBot.alpha = 1
                self.whiteViewBot.alpha = 1
                self.handImageBot.alpha = 1
                self.handYou.alpha = 1
                self.whiteViewYou.alpha = 1
                self.handImageYou.alpha = 1
                self.winLoseOrDrawLabel.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.2, relativeDuration: 0.25) {
                self.winLoseOrDrawLabel.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.35, relativeDuration: 0.45) {
                self.progressView.alpha = 1
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.8, relativeDuration: 0.85) {
                self.handBot.alpha = 0
                self.whiteViewBot.alpha = 0
                self.handImageBot.alpha = 0
                self.handYou.alpha = 0
                self.whiteViewYou.alpha = 0
                self.handImageYou.alpha = 0
                self.winLoseOrDrawLabel.alpha = 0
                self.progressView.alpha = 0
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.9, relativeDuration: 1) {
                self.rockButton.alpha = 1
                self.paperButton.alpha = 1
                self.scissorsButton.alpha = 1
                self.randomButton.alpha = 1
                self.stackSelectLabel.alpha = 1
            }
            
        } completion: { done in
            if done {
                self.checkResult()
            }
        }
    }
    
    private func checkResult() {
        let currentValue = progressView.progress
        
        if currentValue == 1 {
            self.customAlertPause.presentCustomAlert(viewController: self, title: "YOU WIN", text: "Play again", color: .specialYellow)
            self.progressView.setProgress(0.5, animated: true)
            GameCurrencyManager.shared.addCoins(5)
            coinsView.updateCoinsLabel(newBalance: GameCurrencyManager.shared.getCoinsBalance())
        }
        
        if currentValue == 0 {
            self.customAlertPause.presentCustomAlert(viewController: self, title: "YOU LOSE", text: "Play again", color: .specialPurple)
            self.progressView.setProgress(0.5, animated: true)        }
    }
    
    @objc private func pauseButtonTapped() {
        customAlertPause.presentCustomAlert(viewController: self, title: "Pause", text: "Resume", color: .specialWhite)
        customAlertSetting.switchSoundTapped()
    }
    
    @objc private func rockButtonTapped() {
        play(sign: .rock)
        customAlertSetting.switchSoundTapped()
    }
    
    @objc private func paperButtonTapped() {
        play(sign: .paper)
        customAlertSetting.switchSoundTapped()
    }
    
    @objc private func scissorsButtonTapped() {
        play(sign: .scissors)
        customAlertSetting.switchSoundTapped()
    }
    
    @objc private func randomButtonTapped() {
        let randomSign = randomSign()
        play(sign: randomSign)
        customAlertSetting.switchSoundTapped()
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
            
            coinsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            coinsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coinsView.heightAnchor.constraint(equalToConstant: 30),
            coinsView.widthAnchor.constraint(equalToConstant: 100),
            
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
            
            winLoseOrDrawLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            winLoseOrDrawLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            
            handYou.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            handYou.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handYou.widthAnchor.constraint(equalToConstant: 65),
            handYou.topAnchor.constraint(equalTo: whiteViewYou.bottomAnchor),
            
            handBot.topAnchor.constraint(equalTo: view.topAnchor),
            handBot.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handBot.widthAnchor.constraint(equalToConstant: 65),
            handBot.bottomAnchor.constraint(equalTo: whiteViewBot.topAnchor),
            
            whiteViewYou.bottomAnchor.constraint(equalTo: handYou.topAnchor),
            whiteViewYou.centerXAnchor.constraint(equalTo: handYou.centerXAnchor),
            whiteViewYou.widthAnchor.constraint(equalToConstant: 60),
            whiteViewYou.heightAnchor.constraint(equalToConstant: 10),
            
            whiteViewBot.topAnchor.constraint(equalTo: handBot.bottomAnchor),
            whiteViewBot.centerXAnchor.constraint(equalTo: handBot.centerXAnchor),
            whiteViewBot.widthAnchor.constraint(equalToConstant: 60),
            whiteViewBot.heightAnchor.constraint(equalToConstant: 10),
            
            handImageYou.bottomAnchor.constraint(equalTo: whiteViewYou.topAnchor),
            handImageYou.topAnchor.constraint(equalTo: stackSelectLabel.bottomAnchor, constant: 20),
            handImageYou.centerXAnchor.constraint(equalTo: whiteViewYou.centerXAnchor),
            handImageYou.widthAnchor.constraint(equalToConstant: 90),
            handImageYou.heightAnchor.constraint(equalToConstant: 90),
            
            handImageBot.topAnchor.constraint(equalTo: whiteViewBot.bottomAnchor),
            handImageBot.bottomAnchor.constraint(equalTo: stackSelectLabel.topAnchor, constant: -20),
            handImageBot.centerXAnchor.constraint(equalTo: whiteViewBot.centerXAnchor),
            handImageBot.widthAnchor.constraint(equalToConstant: 90),
            handImageBot.heightAnchor.constraint(equalToConstant: 90),
        ])
    }
}


