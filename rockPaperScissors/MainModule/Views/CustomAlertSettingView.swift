//
//  CustomAlertSettingView.swift.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 28/09/2023.
//

import UIKit
import AVFoundation

class CustomAlertSettingView: UIView {
    
    static let share = CustomAlertSettingView()
    
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
    
    private let settingLabel: UILabel = {
        let label = UILabel()
        label.text = "Setting"
        label.font = .robotoBold32()
        label.textColor = .specialWhite
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var switchMusic: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.addTarget(self, action: #selector(switchMusicTapped), for: .valueChanged)
        return toggle
    }()
    
    private lazy var switchSound: UISwitch = {
        let toggle = UISwitch()
        toggle.isOn = true
        toggle.addTarget(self, action: #selector(switchSoundTapped), for: .valueChanged)
        return toggle
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialYellow
        button.layer.cornerRadius = 10
        button.setTitle("Close", for: .normal)
        button.tintColor = .specialBackground
        button.titleLabel?.font = .robotoBold26()
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var stackMusicView = UIStackView()
    private var stackSoundView = UIStackView()
    
    func presentCustomAlert(viewController: UIViewController) {
        
        guard let parentView = viewController.view else { return }
        mainView = parentView
        
        scrollView.frame = parentView.frame
        parentView.addSubview(scrollView)
        
        backgrouundView.frame = parentView.frame
        scrollView.addSubview(backgrouundView)
        
        alertView.frame = CGRect(x: 55, y: -280, width: parentView.frame.width - 110, height: 280)
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
        alertView.addSubview(settingLabel)
        
        stackMusicView = UIStackView(arrangedSubviews: [labelMusicOrSound(text: "Music"), switchMusic], axis: .horizontal, spacing: 70)
        stackSoundView = UIStackView(arrangedSubviews: [labelMusicOrSound(text: "Sound"), switchSound], axis: .horizontal, spacing: 70)
        alertView.addSubview(stackMusicView)
        alertView.addSubview(stackSoundView)
        alertView.addSubview(closeButton)
    }
    
    private func labelMusicOrSound(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .robotoBold26()
        label.textColor = .specialWhite
        return label
    }
    
    @objc private func switchMusicTapped() {
        if switchMusic.isOn {
            MusicSetting.share.audioPlayer?.play()
        } else {
            MusicSetting.share.audioPlayer?.stop()
        }
    }
    
    @objc private func switchSoundTapped() {
        print("tap sound swich")
    }
    
    @objc private func closeButtonTapped() {
       guard let targetView = mainView else { return }
       
       UIView.animate(withDuration: 0.3) {
           self.alertView.frame = CGRect(x: 55, y: targetView.frame.height, width: targetView.frame.width - 110, height: 280)
       } completion: { _ in
           UIView.animate(withDuration: 0.3) {
               self.backgrouundView.alpha = 0
           } completion: { done in
               if done {
                   self.scrollView.removeFromSuperview()
                   self.stackMusicView.removeFromSuperview()
                   self.stackSoundView.removeFromSuperview()
               }
           }
       }
    }
    

}

// MARK: - Set Constraints

extension CustomAlertSettingView {
    
    private func setConstrains() {
        
        NSLayoutConstraint.activate([
            settingLabel.topAnchor.constraint(equalTo: alertView.topAnchor, constant: 30),
            settingLabel.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            stackMusicView.topAnchor.constraint(equalTo: settingLabel.bottomAnchor, constant: 20),
            stackMusicView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            stackSoundView.topAnchor.constraint(equalTo: stackMusicView.bottomAnchor, constant: 30),
            stackSoundView.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 145),
            closeButton.centerXAnchor.constraint(equalTo: alertView.centerXAnchor),
            closeButton.bottomAnchor.constraint(equalTo: alertView.bottomAnchor, constant: -30)
        ])
    }
    
}
