//
//  InstructionsViewController.swift
//  rockPaperScissors
//
//  Created by Rustam Nigmatullin on 08.10.2023.
//

import UIKit

class InstructionsViewController: UIViewController {
    
    private let instructionsLabel: UILabel = {
        let label = UILabel()
        label.text = "See the instructions"
        label.font = .robotoMedium16()
        label.textColor = .specialWhite
        
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton = CloseButton()
    
    private let instructionsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "RPS_instuctions")
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    private func setupViews() {
        view.backgroundColor = .specialBackground
        view.addSubview(instructionsLabel)
        view.addSubview(closeButton)
        view.addSubview(instructionsImageView)
    }
}

extension InstructionsViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            instructionsLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            instructionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: instructionsLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 27),
            closeButton.widthAnchor.constraint(equalToConstant: 27),
            
            instructionsImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            instructionsImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
}
