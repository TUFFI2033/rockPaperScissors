//
//  PlayViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 26/10/2023.
//

import UIKit

class PlayViewController: UIViewController {
    
    var countRound = 1
    var countWin = 0
    var countLose = 0
    
    private lazy var pauseButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "pauseImage"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(pauseButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let winLoseOrDrawLabel = UILabel()
    private let customAlertPause = CustomAlert()
    private let coinsView = CoinsView()
    private let handYou = Hand(background: .specialYellow)
    private let handBot = Hand(background: .specialPurple)
    private let victoryLapView = VictoryLapView()
    private let victoryLapViewOne = VictoryLapView()
    private let victoryLapViewTwo = VictoryLapView()
    private let victoryLapViewBot = VictoryLapView()
    private let victoryLapViewOneBot = VictoryLapView()
    private let victoryLapViewTwoBot = VictoryLapView()
    private let gameSelectionView = GameSelectionView()
    private let progressView = ProgressView()
    
    private lazy var victoryLabStackView = UIStackView(
        arrangedSubviews: [victoryLapView, victoryLapViewOne, victoryLapViewTwo],
        axis: .vertical,
        spacing: 10)
    private lazy var victoryLabStackViewBot = UIStackView(
        arrangedSubviews: [victoryLapViewBot, victoryLapViewOneBot, victoryLapViewTwoBot],
        axis: .vertical,
        spacing: 10)
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(countRound)
        print(countWin)
        print(countLose)

        circleСhangesBackground()
        resetGame()
        coinsView.updateCoinsLabel(newBalance: GameCurrencyManager.shared.getCoinsBalance())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        gameSelectionView.playViewController = self
        customAlertPause.playViewController = self
        
        handBot.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        victoryLabStackView.distribution = .fillEqually
        victoryLabStackViewBot.distribution = .fillEqually
        
        winLoseOrDrawLabel.translatesAutoresizingMaskIntoConstraints = false
        winLoseOrDrawLabel.font = .robotoBold36()
        
        view.addSubview(pauseButton)
        view.addSubview(coinsView)
        view.addSubview(handYou)
        view.addSubview(handBot)
        view.addSubview(victoryLabStackView)
        view.addSubview(victoryLabStackViewBot)
        view.addSubview(gameSelectionView)
        view.addSubview(progressView)
        view.addSubview(winLoseOrDrawLabel)
    }
    
    @objc private func pauseButtonTapped() {
        customAlertPause.presentCustomAlert(viewController: self, title: "Pause", text: "Resume", color: .specialWhite)
        CustomAlertSettingView.share.soundPlay()
    }
    
    private func circleСhangesBackground() {
        if countRound == 3 {
            switch countWin {
            case 1: victoryLapView.backgroundColor = .specialYellow
            case 2: victoryLapViewOne.backgroundColor = .specialYellow
            case 3: victoryLapViewTwo.backgroundColor = .specialYellow
            default: print()
            }
            
            switch countLose {
            case 1: victoryLapViewBot.backgroundColor = .specialPurple
            case 2: victoryLapViewOneBot.backgroundColor = .specialPurple
            case 3: victoryLapViewTwoBot.backgroundColor = .specialPurple
            default: print()
            }
        }
    }
    
    private func checkResult() {
        
        if  countWin == countRound {
            self.customAlertPause.presentCustomAlert(viewController: self, title: "YOU WIN", text: "Play Again", color: .specialYellow)
            GameCurrencyManager.shared.addCoins(10)
        }
        
        if countLose == countRound {
            self.customAlertPause.presentCustomAlert(viewController: self, title: "YOU LOSE", text: "Play Again", color: .specialPurple)
            GameCurrencyManager.shared.minusCoins(5)
        }
        
        if progressView.progress.progress == 1 {
            self.customAlertPause.presentCustomAlert(viewController: self, title: "YOU WIN", text: "Play Again", color: .specialYellow)
            GameCurrencyManager.shared.addCoins(10)
        }
        
        if progressView.progress.progress == 0 {
            self.customAlertPause.presentCustomAlert(viewController: self, title: "YOU LOSE", text: "Play Again", color: .specialPurple)
            GameCurrencyManager.shared.minusCoins(5)
        }
    }
    
    func play(signEnum: Sign.SignEnum) {
        let computerSign = Sign.shared.randomSign()
        
        switch computerSign {
        case .rock:
            handBot.setNewImageHand(imageNamed: "rockHandSpecialBackground")
        case .paper:
            handBot.setNewImageHand(imageNamed: "handPaperSpecialBackground")
        case .scissors:
            handBot.setNewImageHand(imageNamed: "handSccisorsSpecialBackground")
        }
        
        switch signEnum {
        case .rock:
            handYou.setNewImageHand(imageNamed: "rockHandSpecialBackground")
        case .paper:
            handYou.setNewImageHand(imageNamed: "handPaperSpecialBackground")
        case .scissors:
            handYou.setNewImageHand(imageNamed: "handSccisorsSpecialBackground")
        }
        
        let result = signEnum.getResult(oposite: computerSign)
        let currentProgress = progressView.progress.progress
        
        switch result {
        case .start:
            print("Never")
        case .win:
            countWin += 1
            progressView.progress.setProgress(currentProgress + 0.25, animated: true)
            winLoseOrDrawLabel.text = "WIN"
            winLoseOrDrawLabel.textColor = .specialYellow
            print("win")
        case .lose:
            countLose += 1
            progressView.progress.setProgress(currentProgress - 0.25, animated: true)
            winLoseOrDrawLabel.text = "LOSE"
            winLoseOrDrawLabel.textColor = .specialPurple
            print("lose")
        case .draw:
            winLoseOrDrawLabel.text = "DRAW"
            winLoseOrDrawLabel.textColor = .white
            print("draw")
        }
        circleСhangesBackground()
        checkResult()
        coinsView.updateCoinsLabel(newBalance: GameCurrencyManager.shared.getCoinsBalance())
    }
    
    func resetGame() {
        countWin = 0
        countLose = 0
        
        handYou.setNewImageHand(imageNamed: "rockHandSpecialBackground")
        handBot.setNewImageHand(imageNamed: "rockHandSpecialBackground")
        victoryLapView.backgroundColor = .none
        victoryLapViewOne.backgroundColor = .none
        victoryLapViewTwo.backgroundColor = .none
        victoryLapViewBot.backgroundColor = .none
        victoryLapViewOneBot.backgroundColor = .none
        victoryLapViewTwoBot.backgroundColor = .none
        winLoseOrDrawLabel.text = ""
        
        if countRound > 3 {
            winLoseOrDrawLabel.isHidden = true
            progressView.isHidden = false
        } else {
            winLoseOrDrawLabel.isHidden = false
            progressView.isHidden = true
        }
        
        if countRound == 3 {
            victoryLabStackView.isHidden = false
            victoryLabStackViewBot.isHidden = false
        } else {
            victoryLabStackView.isHidden = true
            victoryLabStackViewBot.isHidden = true
        }
        
        progressView.progress.setProgress(0.5, animated: false)
    }
    
    func animationHand() {
        UIView.animate(withDuration: 2, animations: { [self] in
            handYou.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            view.layoutIfNeeded()
        })
    }
}

//MARK: - Set Constrains

extension PlayViewController {
    
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
            
            handYou.widthAnchor.constraint(equalToConstant: 65),
            handYou.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handYou.topAnchor.constraint(equalTo: victoryLabStackView.bottomAnchor, constant: 100),
            handYou.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            handBot.widthAnchor.constraint(equalToConstant: 65),
            handBot.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            handBot.bottomAnchor.constraint(equalTo: victoryLabStackViewBot.topAnchor, constant: -100),
            handBot.topAnchor.constraint(equalTo: view.topAnchor),
            
            victoryLabStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            victoryLabStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            victoryLabStackView.heightAnchor.constraint(equalToConstant: 80),
            victoryLabStackView.widthAnchor.constraint(equalToConstant: 20),
            
            victoryLabStackViewBot.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            victoryLabStackViewBot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            victoryLabStackViewBot.heightAnchor.constraint(equalToConstant: 80),
            victoryLabStackViewBot.widthAnchor.constraint(equalToConstant: 20),
            
            gameSelectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            gameSelectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            gameSelectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            gameSelectionView.heightAnchor.constraint(equalTo: gameSelectionView.widthAnchor, multiplier: 0.4),
            
            progressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            progressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            progressView.heightAnchor.constraint(equalToConstant: 20),
            progressView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            winLoseOrDrawLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            winLoseOrDrawLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
