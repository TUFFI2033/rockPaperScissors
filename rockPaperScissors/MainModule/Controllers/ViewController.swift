//
//  ViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 24/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    private let iCraftersLabel: UILabel = {
        let label = UILabel()
        label.text = "© 2023 iCrafters Inc. All rights reserved."
        label.textColor = .specialWhite
        label.font = .robotoBold13()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoImage: UIImageView = {
        let img = UIImageView(image: UIImage(named: "rockPaperScissors"))
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var settingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settingImage"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(settingButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var playButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("PLAY", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold36()
        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var seeInstructionButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See the instruction ?", for: .normal)
        button.tintColor = .specialWhite
        button.titleLabel?.font = .robotoMediu16()
        button.addTarget(self, action: #selector(seeInstructionButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(logoImage)
        view.addSubview(settingButton)
        view.addSubview(playButton)
        view.addSubview(seeInstructionButton)
        view.addSubview(iCraftersLabel)
    }
    
    @objc private func settingButtonTapped() {
        print("Tap setting")
    }
    
    @objc private func playButtonTapped() {
        print("Tap play")
    }
    
    @objc private func seeInstructionButtonTapped() {
        print("Tap See the instruction")
    }
}

// MARK: - Set Constraints

extension ViewController {
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 135),
            logoImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            logoImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),
            
            settingButton.heightAnchor.constraint(equalToConstant: 40),
            settingButton.widthAnchor.constraint(equalToConstant: 40),
            settingButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            settingButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            playButton.heightAnchor.constraint(equalToConstant: 70),
            playButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 240),
            playButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            playButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            
            seeInstructionButton.heightAnchor.constraint(equalToConstant: 20),
            seeInstructionButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 20),
            seeInstructionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100),
            seeInstructionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100),
            
            iCraftersLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 10),
            iCraftersLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
    }
}
