//
//  CustomAlertPause.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 30/09/2023.
//

import UIKit

class CustomAlertPause {
    
    private let scrollView = UIScrollView()
    private var mainView: UIView?
    
    private let backgrouundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private let alertView: UIView = {
        let view = UIView()
        view.backgroundColor = .specialBackground
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let pauseLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = .robotoBold32()
        label.textColor = .specialWhite
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var resumeButton = UIButton()
    private lazy var quitButton = UIButton()
    private lazy var stackView = UIStackView()
    
    func presentCustomAlert(viewController: UIViewController) {
        
        guard let parentView = viewController.view else { return }
        mainView = parentView
        
        scrollView.frame = parentView.frame
        parentView.addSubview(scrollView)
        
        backgrouundView.frame = parentView.frame
        scrollView.addSubview(backgrouundView)
        
        alertView.frame = CGRect(x: 55, y: -220, width: parentView.frame.width - 110, height: 220)
        scrollView.addSubview(alertView)
        
        
        UIView.animate(withDuration: 0.3) {
            self.backgrouundView.alpha = 0.8
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.3) {
                    self.alertView.center = parentView.center
                }
            }
        }
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        alertView.addSubview(pauseLabel)
        
        resumeButton = createButton(text: "Resume")
        quitButton = createButton(text: "Quit")
        resumeButton.addTarget(self, action: #selector(resumeButtonTapped), for: .touchUpInside)
        quitButton.addTarget(self, action: #selector(quitButtonTapped), for: .touchUpInside)
        stackView = UIStackView(arrangedSubviews: [resumeButton, quitButton],
                                axis: .vertical, spacing: 10)
        alertView.addSubview(stackView)
    }
    
    private func createButton(text: String) -> UIButton {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle(text, for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoMedium20()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }
    
    @objc private func resumeButtonTapped() {
       guard let targetView = mainView else { return }
       
       UIView.animate(withDuration: 0.3) {
           self.alertView.frame = CGRect(x: 55, y: targetView.frame.height, width: targetView.frame.width - 110, height: 280)
       } completion: { _ in
           UIView.animate(withDuration: 0.3) {
               self.backgrouundView.alpha = 0
           } completion: { done in
               if done {
                   self.scrollView.removeFromSuperview()
               }
           }
       }
    }
    
    @objc private func quitButtonTapped() {
        guard let targetView = mainView else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.alertView.frame = CGRect(x: 55, y: targetView.frame.height, width: targetView.frame.width - 110, height: 280)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.backgrouundView.alpha = 0
            } completion: { done in
                if done {
                    self.scrollView.removeFromSuperview()
                    if let viewController = self.mainView?.findViewController(ofType: StartPlayViewController.self) {
                        viewController.dismiss(animated: true)
                    }
                }
            }
        }
    }
}

// MARK: - Set Constraints

extension CustomAlertPause {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            pauseLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 30),
            pauseLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            stackView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            stackView.widthAnchor.constraint(equalToConstant: 130),
            stackView.topAnchor.constraint(equalTo: pauseLabel.bottomAnchor, constant: 20)
        ])
    }
    
}

