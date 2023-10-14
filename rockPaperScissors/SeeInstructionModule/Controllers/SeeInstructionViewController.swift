//
//  SeeInstructionViewController.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 11/10/2023.
//

import UIKit

class SeeInstructionViewController: UIViewController {

    private let seeLabel: UILabel = {
        let label = UILabel()
        label.text = "See the instruction "
        label.font = .robotoMedium16()
        label.textColor = .specialWhite
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let closeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let imageRPS: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "RPS_instuctions")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setConstraint()
    }

    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(seeLabel)
        view.addSubview(closeButton)
        view.addSubview(imageRPS)
        
        closeButton.addTarget(self, action: #selector(seeCloseButton), for: .touchUpInside)
    }
    
    @objc private func seeCloseButton() {
        let customAlertSetting = CustomAlertSettingView()
        self.dismiss(animated: true)
        customAlertSetting.switchSoundTapped()
    }
}

//MARK: - Set Constraint

extension SeeInstructionViewController {
    
    private func setConstraint() {
        NSLayoutConstraint.activate([
            seeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 15),
            seeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: seeLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            closeButton.widthAnchor.constraint(equalToConstant: 27),
            closeButton.heightAnchor.constraint(equalToConstant: 27),
            
            imageRPS.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            imageRPS.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            imageRPS.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageRPS.heightAnchor.constraint(equalToConstant: 375)
        ])
    }
}
