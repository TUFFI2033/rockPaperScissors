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
    
    private lazy var stackSelectLabel = UIStackView()
    private lazy var rockButton = UIButton()
    private lazy var paperButton = UIButton()
    private lazy var scissorsButton = UIButton()
    private lazy var randomButton = UIButton()
    private lazy var stackPaperRandom = UIStackView()
    private let customAlertPause = CustomAlertPause()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(pauseButton)
        
        stackSelectLabel = UIStackView(arrangedSubviews:
                                        [selectActionLabel(text: "Select an", color: .specialWhite),
                                         selectActionLabel(text: "Action", color: .specialYellow)],
                                    axis: .horizontal,
                                    spacing: 10)
        view.addSubview(stackSelectLabel)
        
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
        view.addSubview(stackPaperRandom)
        view.addSubview(rockButton)
        view.addSubview(scissorsButton)
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
    
    @objc private func pauseButtonTapped() {
        customAlertPause.presentCustomAlert(viewController: self)
    }
    
    @objc private func rockButtonTapped() {
        print("tap rock")
    }
    
    @objc private func paperButtonTapped() {
        print("tap paper")
    }
    
    @objc private func scissorsButtonTapped() {
        print("tap scissors")
    }
    
    @objc private func randomButtonTapped() {
        print("tap random")
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
        ])
    }
}
