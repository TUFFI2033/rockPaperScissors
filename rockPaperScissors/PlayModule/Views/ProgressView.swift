//
//  ProgressView.swift
//  rockPaperScissors
//
//  Created by Ivan Byndiu on 28/10/2023.
//

import UIKit

class ProgressView: UIView {
    
    let progress: UIProgressView = {
        let progress = UIProgressView()
        progress.trackTintColor = .specialYellow
        progress.progressTintColor = .specialPurple
        progress.setProgress(0.5, animated: false)
        progress.translatesAutoresizingMaskIntoConstraints = false
        return progress
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.masksToBounds = true
        layer.cornerRadius = 10
        
        addSubview(progress)
        progress.topAnchor.constraint(equalTo: topAnchor).isActive = true
        progress.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        progress.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        progress.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
